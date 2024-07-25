import { hash } from 'bcryptjs';
import { AppDataSource } from './data-source';
import { User } from './src/users/user.entity';

async function seed() {
  await AppDataSource.initialize();

  const userRepository = AppDataSource.getRepository(User);

  const users = [
    {
      name: 'Admin User',
      email: 'admin@example.com',
      password: await hash('admin_password', 10),
      permissionList: ['read.*'],
      role: 'admin',
    },
    {
      name: 'Super Admin User',
      email: 'superadmin@example.com',
      password: await hash('superadmin_password', 10),
      permissionList: ['create.*', 'read.*', 'update.*', 'delete.*', 'manage_users'],
      role: 'superadmin',
    },
    {
      name: 'Member User',
      email: 'member@example.com',
      password: await hash('member_password', 10),
      permissionList: ['read.preview.*'],
      role: 'member',
    },
  ];

  for (const userData of users) {
    const user = userRepository.create(userData);
    await userRepository.save(user);
  }

  console.log('Seeding completed');
  process.exit();
}

seed().catch((error) => {
  console.error('Error seeding data:', error);
  process.exit(1);
});
