class Relationship < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '本人(世帯主)'},
    { id: 2, name: '妻'},
    { id: 3, name: '夫'},
    { id: 4, name: '子'},
    { id: 5, name: '祖父'},
    { id: 6, name: '祖母'}
  ]

  include ActiveHash::Associations
  has_many :users

end