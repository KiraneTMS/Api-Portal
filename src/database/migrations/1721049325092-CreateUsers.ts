import { MigrationInterface, QueryRunner, Table } from "typeorm";

export class CreateUsers1721049325092 implements MigrationInterface {

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.createTable(
          new Table({
            name: 'user',
            columns: [
              {
                name: 'id',
                type: 'int',
                isPrimary: true,
                isGenerated: true,
                generationStrategy: 'increment',
              },
              {
                name: 'email',
                type: 'varchar',
                isUnique: true,
              },
              {
                name: 'name',
                type: 'varchar',
              },
              {
                name: 'password',
                type: 'varchar',
              },
              {
                name: 'permissionList',
                type: 'text',
                isNullable: true,
              },
              {
                name: 'role',
                type: 'varchar',
                default: `'member'`,
              },
            ],
          }),
        );
      }
    
      public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.dropTable('user');
      }

}
