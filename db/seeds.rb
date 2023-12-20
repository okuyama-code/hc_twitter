# frozen_string_literal: true

# ================ sato =================
sato = User.create!(name: '佐藤', username: 'sato0101', email: 'sato@example.com', password: '484848',
                    date_of_birth: '1990-01-01', telephone: '09011112222', self_introduction: 'はじめまして！佐藤です！', location: '東京', website: 'sato-portfolio-site.vercel.app')

sato.icon.attach(io: File.open(Rails.root.join('app/assets/images/EC1.jpg')), filename: 'EC1.jpg')
sato.header.attach(io: File.open(Rails.root.join('app/assets/images/suisu0.jpg')), filename: 'suisu0.jpg')
sato.save!

# =================== yamada =================
yamada = User.create!(name: '山田', username: 'yamada0101', email: 'yamada@example.com', password: '484848',
                      date_of_birth: '1990-01-01', telephone: '09011112222', self_introduction: 'はじめまして！山田です！', location: '大阪', website: 'yamada-portfolio-site.vercel.app')

yamada.icon.attach(io: File.open(Rails.root.join('app/assets/images/EC2.jpg')), filename: 'EC2.jpg')
yamada.header.attach(io: File.open(Rails.root.join('app/assets/images/suisu1.jpg')), filename: 'suisu1.jpg')
yamada.save!

# =================== suzuki =================
suzuki = User.create!(name: 'suzuki', username: 'suzuki0101', email: 'suzuki@example.com', password: '484848',
                      date_of_birth: '1990-01-01', telephone: '09011112222', self_introduction: 'はじめまして！suzukiです！', location: '宮城', website: 'suzuki-portfolio-site.vercel.app')

suzuki.icon.attach(io: File.open(Rails.root.join('app/assets/images/EC3.jpg')), filename: 'EC3.jpg')
suzuki.header.attach(io: File.open(Rails.root.join('app/assets/images/suisu2.jpg')), filename: 'suisu1.jpg')
suzuki.save!

# =================== okuyama =================
okuyama = User.create!(name: 'okuyama | HC', username: 'okuyama4848', email: 'ooyy0121@gmail.com', password: '484848',
                       date_of_birth: '1998-01-21', telephone: '09011112222', self_introduction: 'はじめまして! okuyamaです!', location: '千葉', website: 'okuyama-portfolio-site.vercel.app')

okuyama.icon.attach(io: File.open(Rails.root.join('app/assets/images/icon.png')), filename: 'icon.png')
okuyama.header.attach(io: File.open(Rails.root.join('app/assets/images/header.jpg')), filename: 'header.jpg')
okuyama.save!

# ============ Post.create ===============

sato.posts.create!(post_content: '佐藤の１回目の投稿です')
yamada.posts.create!(post_content: '山田の１回目の投稿です')
sato.posts.create!(post_content: '佐藤の２回目の投稿です')
suzuki.posts.create!(post_content: '鈴木の1回目の投稿です')
yamada_post2 = yamada.posts.create!(post_content: '山田の２回目の投稿です')
sato_post3 = sato.posts.create!(post_content: '佐藤の3回目の投稿です')
suzuki.posts.create!(post_content: '鈴木の2回目の投稿です')
suzuki.posts.create!(post_content: '鈴木3回目の投稿です')
suzuki_post4 = suzuki.posts.create!(post_content: '鈴木の4回目の投稿です')
suzuki_post5 = suzuki.posts.create!(post_content: '鈴木の5回目の投稿です')
okuyama_post1 = okuyama.posts.create!(post_content: 'okuyamaの1回目の投稿です')
okuyama_post2 = okuyama.posts.create!(post_content: 'okuyamaの2回目の投稿です')
okuyama_post3 = okuyama.posts.create!(post_content: 'okuyamaの3回目の投稿です')

# ================= comment =====================
sato.comments.create!(comment_content: '佐藤が鈴木にコメントしました', post_id: suzuki_post5.id)
yamada.comments.create!(comment_content: '山田が鈴木にコメントしました', post_id: suzuki_post5.id)
yamada.comments.create!(comment_content: '山田が鈴木に2回目のコメントしました', post_id: suzuki_post5.id)
sato.comments.create!(comment_content: '佐藤が鈴木に2回目のコメントしました', post_id: suzuki_post5.id)
yamada.comments.create!(comment_content: '山田が佐藤にコメントしました', post_id: sato_post3.id)

# ================= likes =================
sato.likes.create!(post_id: suzuki_post5.id)
sato.likes.create!(post_id: yamada_post2.id)

# ============= reposts ===================
sato.reposts.create!(post_id: suzuki_post4.id)
sato.reposts.create!(post_id: suzuki_post5.id)

# ============= followする =====================
sato.relationships.create!(following_id: yamada.id, follower_id: yamada.id)
yamada.relationships.create!(following_id: suzuki.id, follower_id: suzuki.id)

#==================== DM ===================
# room1 = Message.create()


# ============== 通知 ================
okuyama_post1.create_notification_like!(sato)
okuyama_post1.create_notification_like!(suzuki)
okuyama_post1.create_notification_like!(yamada)

suzuki_post5.create_notification_like!(sato)
suzuki_post5.create_notification_like!(yamada)
suzuki_post5.create_notification_like!(okuyama)

yamada_post2.create_notification_like!(sato)
yamada_post2.create_notification_like!(suzuki)
yamada_post2.create_notification_like!(okuyama)

sato_post3.create_notification_like!(suzuki)
sato_post3.create_notification_like!(okuyama)
sato_post3.create_notification_like!(yamada)
