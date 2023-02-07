module EmployeeHelper
  def department_filter_collection
    Department.pluck(:name, :id).insert(0, ['Select Department', nil])
  end
end
