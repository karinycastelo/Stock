class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def is_admin?
    self.role_id == 1
  end

  def not_admin
    User.all.where("role_id != 1")
  end

  def role?(role_id)
    self.role_id == role_id
  end

  def cargo
    return "Funcionário" if self.role_id == 5
    return "Gerente" if self.role_id == 4
    return "Sub-Secretário" if self.role_id == 3
    return "Secretário" if self.role_id == 2
    return "Admin" if self.role_id == 1
  end

  def roles
    # return [1, "Admin"], [2, "Secretário"], [3, "Sub-Secretário"], [4, "Gerente"], [5, "Funcionário"]]
    [["Admin",1], ["Secretário", 2], ["Sub-Secretário", 3], ["Gerente",4 ], ["Funcionário", 5]]


    # [
    #   { id: 1, name: "Admin" },
    #   { id: 2, name: "Secretário" },
    #   { id: 3, name: "Sub-Secretário" },
    #   { id: 4, name: "Gerente" },
    #   { id: 5, name: "Funcionário" }
    # ]
  end
  
    # Roles
    # 1 - Admin
    # 2 - Secretário
    # 3 - Sub-Secretário
    # 4 - Gerente
    # 5 - Funcionário
   
end
