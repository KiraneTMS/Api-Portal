import { Injectable, Logger } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import * as bcrypt from 'bcryptjs';

@Injectable()
export class AuthService {
  private readonly logger = new Logger(AuthService.name);

  constructor(
    private usersService: UsersService,
    private jwtService: JwtService
  ) {}

  async validateUser(email: string, pass: string): Promise<any> {
    try {
      this.logger.debug(`Validating user with email: ${email}`);

      const user = await this.usersService.findOneByEmail(email);
      if (user && await bcrypt.compare(pass, user.password)) {
        const { password, ...result } = user;
        this.logger.debug(`User validated successfully: ${JSON.stringify(result)}`);
        return result;
      }

      this.logger.debug(`User not found or password does not match`);
      return null;
    } catch (error) {
      this.logger.error(`Error validating user: ${error.message}`);
      throw error; // Rethrow the error to be caught by NestJS error handling
    }
  }

  async login(user: any) {
    try {
      this.logger.debug(`Logging in user: ${JSON.stringify(user)}`);

      const payload = { email: user.email, sub: user.id, role: user.role };
      const accessToken = this.jwtService.sign(payload);

      this.logger.debug(`User logged in successfully. Access token: ${accessToken}`);
      return { access_token: accessToken };
    } catch (error) {
      this.logger.error(`Error logging in user: ${error.message}`);
      throw error; // Rethrow the error to be caught by NestJS error handling
    }
  }

  async register(user: any) {
    try {
      this.logger.debug(`Registering new user: ${JSON.stringify(user)}`);

      const hashedPassword = await bcrypt.hash(user.password, 10);
      const newUser = await this.usersService.create({ ...user, password: hashedPassword });

      this.logger.debug(`User registered successfully: ${JSON.stringify(newUser)}`);
      return newUser;
    } catch (error) {
      this.logger.error(`Error registering user: ${error.message}`);
      throw error; // Rethrow the error to be caught by NestJS error handling
    }
  }
}
