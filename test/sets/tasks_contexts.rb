module Contexts
  module TasksContexts
    def create_tasks
    end

    def delete_tasks
    end

    def create_generic_tasks
      @task1 = FactoryBot.create(:task, badge: @badge3a, name: 'Task 1', order: 1)
      @task2 = FactoryBot.create(:task, badge: @badge3a, name: 'Task 2', order: 2)
      @task3 = FactoryBot.create(:task, badge: @badge3a, name: 'Task 3', order: 3)
      @task4 = FactoryBot.create(:task, badge: @badge3a, name: 'Task 4', order: 4)
    end

    def delete_generic_tasks
      @task1.delete
      @task2.delete
      @task3.delete
      @task4.delete
    end

    def create_generic_3_tasks
      @task1 = FactoryBot.create(:task, badge: @badge4a, name: 'Task 1', order: 1)
      @task2 = FactoryBot.create(:task, badge: @badge4a, name: 'Task 2', order: 2)
      @task3 = FactoryBot.create(:task, badge: @badge4a, name: 'Task 3', order: 3)
    end

    def delete_generic_3_tasks
      @task1.delete
      @task2.delete
      @task3.delete
    end
  end
end
