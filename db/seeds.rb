# frozen_string_literal: true

# ================ sato =================
sato = User.create!(name: "佐藤", username: "sato0101", email: "sato@gmail.com", password: "484848", date_of_birth: '1990-01-01', telephone: '09011112222', self_introduction: "はじめまして！佐藤です！", location: "東京", website: "sato-portfolio-site.vercel.app")

sato.icon.attach(io: File.open(Rails.root.join('app/assets/images/EC1.jpg')), filename: 'EC1.jpg')
sato.header.attach(io: File.open(Rails.root.join('app/assets/images/suisu0.jpg')), filename: 'suisu0.jpg')
sato.save!

# =================== yamada =================
yamada = User.create!(name: "山田", username: "yamada0101", email: "yamada@gmail.com", password: "484848", date_of_birth: '1990-01-01', telephone: '09011112222', self_introduction: "はじめまして！山田です！", location: "大阪", website: "yamada-portfolio-site.vercel.app")

yamada.icon.attach(io: File.open(Rails.root.join('app/assets/images/EC2.jpg')), filename: 'EC2.jpg')
yamada.header.attach(io: File.open(Rails.root.join('app/assets/images/suisu1.jpg')), filename: 'suisu1.jpg')
yamada.save!

# =================== yamada =================
suzuki = User.create!(name: "suzuki", username: "suzuki0101", email: "suzuki@gmail.com", password: "484848", date_of_birth: '1990-01-01', telephone: '09011112222', self_introduction: "はじめまして！suzukiです！", location: "宮城", website: "suzuki-portfolio-site.vercel.app")

suzuki.icon.attach(io: File.open(Rails.root.join('app/assets/images/EC3.jpg')), filename: 'EC3.jpg')
suzuki.header.attach(io: File.open(Rails.root.join('app/assets/images/suisu2.jpg')), filename: 'suisu1.jpg')
suzuki.save!




# ============ Post.create ===============

sato.posts.create!(post_content: "佐藤の１回目の投稿です")
yamada.posts.create!(post_content: "山田の１回目の投稿です")
sato.posts.create!(post_content: "佐藤の２回目の投稿です")
suzuki.posts.create!(post_content: "鈴木の1回目の投稿です")
yamada.posts.create!(post_content: "山田の２回目の投稿です")
sato_post3 = sato.posts.create!(post_content: "佐藤の3回目の投稿です")
suzuki_post2 = suzuki.posts.create!(post_content: "鈴木の2回目の投稿です")

# ================= comment =====================
sato.comments.create!(comment_content: "佐藤が鈴木にコメントしました", post_id: suzuki_post2.id)
yamada.comments.create!(comment_content: "山田が佐藤にコメントしました", post_id: sato_post3.id)
