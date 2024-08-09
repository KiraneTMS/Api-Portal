import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('food_exp_pct')
export class FoodExpPct {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 255 })
  kelompok: string;

  @Column('decimal', { precision: 5, scale: 2 })
  persentase: number;
}
