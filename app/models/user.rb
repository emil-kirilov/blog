class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable
    #     :recoverable, :trackable, :validatable
  mount_uploaders :files, FileUploader

  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id', optional: :true

  validates_length_of :name, :within => 6..20, :too_long => "pick a shorter name", :too_short => "pick a longer name"

  ROLES = %w(user reseller admin)

  def all_descendants
    direct_descendants = User.where(creator_id: id).to_a
    return [] if direct_descendants.empty?

    inderect_descendants = User.where(creator_id: direct_descendants.map(&:id)).to_a
    direct_descendants.concat(inderect_descendants)
  end

  def can_create_users
    return []       if user?
    return ['user'] if reseller?
    ['user', 'reseller']
  end

  def admin?
    role == 'admin'
  end

  def reseller?
    role == 'reseller'
  end

  def user?
    role == 'user'
  end
end
