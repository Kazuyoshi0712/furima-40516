## Usersテーブル
| Column              | Type         | Options               |
|---------------------|--------------|-----------------------|
| name                | string       | null: false           |
| email               | string       | null:false,unique     |
| password_digest     | string       | null:false            |
| created_at          | datetime     |                       |
| updated_at          | datetime     |                       |

### Association
has_many :items
has_many :comments
has_many :purchases
has_secure_password


## Itemsテーブル
| Column              | Type         | Options               |
|---------------------|--------------|-----------------------|
| name                | string       | null:false            |
| description         | text         | null:false            |
| price               | integer      | null:false            |
| user_id             | integer      | foreign key(users.id) |
| created_at          | datetime     |                       |
| updated_at          | datetime     |                       |

### Association
belongs_to :user
has_many :comments
has_many :images
has_one :purchase

## Commentsテーブル
| Column              | Type         | Options               |
|---------------------|--------------|-----------------------|
| content             | text         | null:false            |
| user_id             | integer      | foreign key(users.id) |
| item_id             | integer      | foreign key(items.id) |
| created_at          | datetime     |                       |
| updated_at          | datetime     |                       |

### Association
belongs_to :user
belongs_to :item


## Purchasesテーブル
| Column              | Type         | Options               |
|---------------------|--------------|-----------------------|
| user_id             | integer      | foreign key(user.id)  |
| item_id             | integer      | foreign key(items.id) |
| created_at          | datetime     |                       |
| updated_at          | datetime     |                       |

### Association
belongs_to :user
belongs_to :item


## Imagesテーブル
| Column              | Type         | Options               |
|---------------------|--------------|-----------------------|
| url                 | string       | null:false            |
| item_id             | integer      | foreign key(items.id) |
| created_at          | datetime     |                       |
| update_at           | datetime     |                       |

### Association
belongs_to :item
