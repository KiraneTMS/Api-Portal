import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('food_exp')
export class FoodExp {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 255 })
  kelompok: string;

  @Column()
  kota: number;

  @Column()
  desa: number;

  @Column()
  jumlah: number;
}
