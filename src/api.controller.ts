import { Controller, Get } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { FoodExp } from './entities/food-exp.entity';
import { NonFoodExp } from './entities/nonfood-exp.entity';
import { FoodExpPct } from './entities/food-exp-pct.entity';
import { NonFoodExpPct } from './entities/nonfood-exp-pct.entity';

@Controller('api')
export class ApiController {
  constructor(
    @InjectRepository(FoodExp) private readonly foodExpRepository: Repository<FoodExp>,
    @InjectRepository(NonFoodExp) private readonly nonFoodExpRepository: Repository<NonFoodExp>,
    @InjectRepository(FoodExpPct) private readonly foodExpPctRepository: Repository<FoodExpPct>,
    @InjectRepository(NonFoodExpPct) private readonly nonFoodExpPctRepository: Repository<NonFoodExpPct>,
  ) {}

  @Get('food-exp')
  async getFoodExp() {
    return this.foodExpRepository.find();
  }

  @Get('nonfood-exp')
  async getNonFoodExp() {
    return this.nonFoodExpRepository.find();
  }

  @Get('food-exp-pct')
  async getFoodExpPct() {
    return this.foodExpPctRepository.find();
  }

  @Get('nonfood-exp-pct')
  async getNonFoodExpPct() {
    return this.nonFoodExpPctRepository.find();
  }
}
