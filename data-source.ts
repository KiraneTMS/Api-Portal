import { DataSource } from 'typeorm';
import { User } from './src/users/user.entity';
import { CreateUsers1721049325092 } from './src/database/migrations/1721049325092-CreateUsers';

export const AppDataSource = new DataSource({
  type: 'postgres',
  host: 'localhost',
  port: 5432,
  username: 'postgres',
  password: 'arsyaalifian2018',
  database: 'bpsapidb',
  entities: [User],
  migrations: [CreateUsers1721049325092],
  synchronize: false, // Set to false for production
});

AppDataSource.initialize()
  .then(() => {
    console.log('Data Source has been initialized!');
  })
  .catch((err) => {
    console.error('Error during Data Source initialization:', err);
  });
