## Usersテーブル
| Column                 | Type      | Options                |
|------------------------|-----------|------------------------|
| nickname               | string    | null:false             |
| email                  | string    | null:false,unique:true |
| encrypted_password     | string    | null:false             |
| last_name              | string    | null:false             |
| first_name             | string    | null:false             |
| last_name_kana         | string    | null:false             |
| first_name_kana        | string    | null:false             |
| birth_date             | date      | null:false             |

### Association
has_many :items
has_many :comments
has_many :purchases
has_secure_password

## Itemsテーブル
| Column            | Type      | Options                       |
|-------------------|-----------|-------------------------------|
| name              | string    | null:false                    |
| description       | text      | null:false                    |
| price             | integer   | null:false                    |
| user              | references| null:false, foreign_key: true |
| condition_id      | integer   | null:false                    |
| category_id       | integer   | null:false                    |
| shipping_cost_id  | integer   | null:false                    |
| prefecture_id     | integer   | null:false                    |
| shipping_days_id  | integer   | null:false                    |

### Association
belongs_to :user
has_many :comments
has_one_attached :images
has_one :purchase

## Commentsテーブル
| Column         | Type       | Options                       |
|----------------|------------|-------------------------------|
| content        | text       | null:false                    |
| user           | references | null:false, foreign_key: true |
| item           | references | null:false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item

## Purchasesテーブル
| Column         | Type       | Options                       |
|----------------|------------|-------------------------------|
| user           | references | null:false, foreign_key: true |
| item           | references | null:false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :address

## Addressesテーブル
| Column            | Type       | Options                       |
|-------------------|------------|-------------------------------|
| postal_code       | string     | null:false                    |
| prefecture_id     | integer    | null:false                    |
| city              | string     | null:false                    |
| street_address    | string     | null:false                    |
| building_name     | string     |                               |
| phone_number      | string     | null:false                    |
| purchase          | references | null:false, foreign_key: true |

### Association
belongs_to :purchase
