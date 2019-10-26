# https://github.com/thoughtbot/administrate/issues/192
require "administrate/field/base"

# class HasManyRolesField < Administrate::Field::Base
#   def to_s
#     data
#   end
# end
class HasManyRolesField < Administrate::Field::HasMany
end
