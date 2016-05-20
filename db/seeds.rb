# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', nickname: 'BigDaddyN0tail', roles_mask: 3)
ClassVideo.create!(title: '第一课：创业点子、产品、团队和执行 I & 我们为什么要创业', speakers: 'by Sam Altman @YC, Dustin Moskovitz @Facebook',
                    cover_image: 'http://startup.qiniudn.com/uploads%2Fstep%2Fpicture%2F1%2Fthumb____.png?e=1459657191&token=zPN7za-gz4ounqJIE9e-issWAghIBUl49yqPmNxy:4x_DTLZe2Boojzp6rgMqPE4P_Ok=',
                    video: 'http://7oxett.com1.z0.glb.clouddn.com/video%2F1_cn_new.mp4',
                    description: '演讲嘉宾\r\nSam Altman，Y Combinator的CEO\r\nDustin Moskovitz，Facebook的cofounder\r\n课程讨论\r\n【阅读】给有抱负的19岁青年的一点建议 by Sam Altman\r\n【阅读】成为一名企业家的好理由与坏理由
                    by Dustin Moskovitz\r\n【讨论】关于YC创业课的另一面意见（1）也许好点子是有陷阱的 by 李厚辰\r\n【讨论】想问问大家，大家为什么要创业？\r\n字幕资料\r\n【课程字幕整理】第一课\r\n英文资料\r\nAdvice for Ambitious 19
                    year olds\r\nGood and Bad Reasons to Become an Entrepreneur by Dustin Moskovitz')
Topic.create!(title: 'Peter Thiel is badass!', content: "\"Pick a small market n dominate it!\"")
