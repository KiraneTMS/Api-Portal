import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('nonfood_exp')
export class NonFoodExp {
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
