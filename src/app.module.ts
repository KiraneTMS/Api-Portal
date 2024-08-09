import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import { User } from './users/user.entity';
import { AuthModule } from './auth/auth.module';
import { ApiController } from './api.controller';
import { FoodExp } from './entities/food-exp.entity';
import { NonFoodExp } from './entities/nonfood-exp.entity';
import { FoodExpPct } from './entities/food-exp-pct.entity';
import { NonFoodExpPct } from './entities/nonfood-exp-pct.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      username: 'postgres',
      password: 'arsyaalifian2018', // Ensure that this is secure in a real environment
      database: 'bpsapidb',
      entities: [User, FoodExp, NonFoodExp, FoodExpPct, NonFoodExpPct],
      synchronize: true, // This should be disabled in production
    }),
    TypeOrmModule.forFeature([FoodExp, NonFoodExp, FoodExpPct, NonFoodExpPct]),
    UsersModule,
    AuthModule,
  ],
  controllers: [ApiController], // Register the ApiController
  providers: [],
})
export class AppModule {}
