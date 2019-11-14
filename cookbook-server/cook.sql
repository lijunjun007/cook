/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cook

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-10-31 13:08:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cook_comment
-- ----------------------------


DROP TABLE IF EXISTS `cook_comment`;
CREATE TABLE `cook_comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='视频评论表';

-- ----------------------------
-- Records of cook_comment
-- ----------------------------
INSERT INTO `cook_comment` VALUES ('1', '3', null, '挺好吃', '2019-12-31', '木头人');
INSERT INTO `cook_comment` VALUES ('2', '12', '1', '挺好吃', '2019年10月30日11:41:31', 'tom5');
INSERT INTO `cook_comment` VALUES ('3', '13', '4', '骗我吃肉', '2019年10月30日17:15:58', '小红');

-- ----------------------------
-- Table structure for cook_food
-- ----------------------------
DROP TABLE IF EXISTS `cook_food`;
CREATE TABLE `cook_food` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(32) DEFAULT NULL,
  `foods` varchar(500) DEFAULT NULL,
  `steps` varchar(1000) DEFAULT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `food_type` int(11) DEFAULT NULL,
  `img_url` varchar(50) DEFAULT NULL,
  `user_img` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `zan` int(8) DEFAULT NULL,
  `notice` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='食谱表';

-- ----------------------------
-- Records of cook_food
-- ----------------------------
INSERT INTO `cook_food` VALUES ('1', '盐煎鸡翅', '[{\"food\":\"鸡翅\",\"weight\":\"8个\"},\r\n{\"food\":\"盐\",\"weight\":\"少许\"},\r\n{\"food\":\"玉米油\",\"weight\":\"少许\"}\r\n]', '[\"1.首先，先准备好食材，8个鸡翅中翼，还有盐。\",\"2.把鸡中翼放在大碗里，加入盐，撒上黑胡椒碎，用筷子搅拌均匀。\",\"3.然后装入保鲜袋，加入2毫升的菜籽油，使其均匀分布，然后放入冰箱冷藏6小时。\",\"4.冰箱取出后，就可以开始香煎啦。先煎好一面，在翻过来，等表面金黄色，就差不多了。\",\"5.最后出锅，摆盘，美美的盐煎鸡翅就出锅啦！在配上5颗小圣女果，超完美！！。\"]', '平时在减肥期间，并不是只能天天吃水煮绿叶蔬菜的！我要告诉所有在减肥的朋友，我们也是可以吃肉肉的！！', '1', './img/yjzc.jpg', './img/yh1.jpg', '小晶', '8', '卖梨子卖梨子十块钱4个，卖梨子卖梨子十块钱4个，卖梨子卖梨子十块钱4个');
INSERT INTO `cook_food` VALUES ('2', '牛油果酱什锦虾沙拉', '[{\"food\":\"虾\",\"weight\":\"200g\"},{\"food\":\"西红柿\",\"weight\":\"两个\"},{\"food\":\"菠萝\",\"weight\":\"一片\"},{\"food\":\"牛油果\",\"weight\":\"1/2个\"},{\"food\":\"葡萄干\",\"weight\":\"50g\"},{\"food\":\"朗姆酒\",\"weight\":\"30ml\"},{\"food\":\"淡奶油\",\"weight\":\"100ml\"},{\"food\":\"芥末酱\",\"weight\":\"1汤匙\"},{\"food\":\"胡椒粉\",\"weight\":\"适量\"}]', '[\"1.把葡萄干倒入郎姆酒浸泡（15分钟）备用；松子磨碎；\",\"2.把芒果和西红柿去皮切块，菠萝和棕榈心切块\",\"3.虾去头去尾去皮，用开水烫熟；\",\"4.把以上所有材料都倒进沙拉盘里，吃的时候加入牛油果沙拉酱搅拌均匀即可。\"]', '1、牛油果一定要新鲜开新鲜吃，不能久放，不然很快就会氧化变黄，即使加了柠檬汁也没什么用了。\r\n2、牛油果营养价值虽然高，但也不可无节制多吃，一天最多吃一个就可以了。牛油果是水果中能量最高的一种，脂肪含量约15%，比鸡蛋和鸡肉还高。每100克牛油果约含160千卡能量，能量更是甜苹果的3倍、牛奶的2.7倍。', '2', './img/zhong-1.jpg', './img/yh2.jpg', '小郑', '3', '来哟来哦喝酒吃果果，来哟来哦喝酒吃果果，来哟来哦喝酒吃果果');
INSERT INTO `cook_food` VALUES ('3', '虾皮冬瓜汁', '[{\"food\":\"冬瓜\",\"weight\":\"300g\"},{\"food\":\"虾皮\",\"weight\":\"50g\"},{\"food\":\"小葱\",\"weight\":\"一段\"},{\"food\":\"料酒\",\"weight\":\"5ml\"}]', '[\"用盐搓洗冬瓜皮，然后用水冲洗干净，将冬瓜带皮带瓢和籽一起切成小块，挤入柠檬汁，加水和糖浆用搅拌机打碎即可\"]', '虾皮冬瓜汁浓味鲜，瓜嫩爽滑。将虾皮和冬瓜一起烧，虾皮可以给冬瓜鲜美的味道，而冬瓜可以带给虾皮清淡爽口的味道。很适合需要清淡饮食、减肥爱美的女性朋友和三高人群。', '3', './img/wan-1.jpg', './img/yh3.jpg', '小军', '6', '冬瓜冬瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜');
INSERT INTO `cook_food` VALUES ('4', '香煎鲷鱼', '[{\"food\":\"鲷鱼\",\"weight\":\"一条\"},{\"food\":\"百里香\",\"weight\":\"适量\"},{\"food\":\"红辣椒\",\"weight\":\"1个\"},{\"food\":\"黑胡椒碎\",\"weight\":\"少许\"}]\r\n', '[\"1.根据食材的种类和分量，备好。\",\"2.鲷鱼洗净，切断。\",\"3.鲷鱼预处理（撒盐、百里香、黑胡椒碎）。\",\"4.刷上菜籽油。\",\"5.热锅冷油,放下鲷鱼,香煎。\",\"6.翻面，再煎一会儿。\",\"7.出锅，享用。\"]', '鲷鱼在日本饮食文化上历史悠久，而且吃法多样。鲷 (diāo)鱼，难道只能做刺身？你错了，今天教你一道非常简单的香煎鲷鱼。哇！！好吃又能瘦。', '1', './img/diaoyu.jpg', './img/yh4.jpg', '小雪', '1', '来哟来哦喝酒吃果果，来哟来哦喝酒吃果果，来哟来哦喝酒吃果果');
INSERT INTO `cook_food` VALUES ('5', '西兰花炒蘑菇', '[{\"food\":\"口蘑\",\"weight\":\"200g\"},\r\n{\"food\":\"西兰花\",\"weight\":\"80g\"},\r\n{\"food\":\"胡萝卜\",\"weight\":\"3/1个\"},\r\n{\"food\":\"姜\",\"weight\":\"3g\"},\r\n{\"food\":\"蒜\",\"weight\":\"2瓣\"},\r\n{\"food\":\"生抽\",\"weight\":\"1茶匙\"},\r\n{\"food\":\"盐\",\"weight\":\"少许\"}\r\n]', '[\"1.材料准备好。\",\"2.口蘑洗净切片，胡萝卜切小块，西兰花撕小朵，姜切丝。\",\"3.锅里烧开水，西兰花和胡萝卜焯至断生后捞出控干待用。\",\"4.锅里热油，爆香姜蒜。\",\"5.接着放入口蘑翻炒。\",\"6.放入少量盐，加快口蘑出水。\",\"7.口蘑出水后，打火不断的翻炒收汁。\",\"8.待汁收干，放入生抽。\",\"9.接着放入西兰花和胡萝卜同炒。\",\"10.拌炒均匀后，放入少许盐即可。\"]', '色彩缤纷的蔬菜，颜色丰富，营养也丰富~！', '1', './img/xlhcmg.jpg', './img/yh5.jpg', '小雪', '0', '瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜');
INSERT INTO `cook_food` VALUES ('6', '花生南乳猪蹄', '[{\"food\":\"猪蹄\",\"weight\":\"273g\"},\r\n{\"food\":\"花生\",\"weight\":\"102g\"},\r\n{\"food\":\"南乳\",\"weight\":\"3块\"},\r\n{\"food\":\"姜\",\"weight\":\"3片\"},\r\n{\"food\":\"蒜\",\"weight\":\"2瓣\"},\r\n{\"food\":\"葱\",\"weight\":\"1根\"},\r\n{\"food\":\"冰糖\",\"weight\":\"2g\"},\r\n{\"food\":\"玉米油\",\"weight\":\"3ml\"}\r\n]', '[\"1.根据食材种类和重量，备好。\",\"2.蒜切碎。\",\"3.葱切段。\",\"4.取一奶锅，加入1000毫升水，加入姜片和葱段，加入洗过的猪蹄。\",\"5.煮出血沫后，捞出猪蹄。\",\"6.将猪蹄放入冰水浸泡五分钟，捞出。\",\"7.热锅冷油，约20秒，加入蒜末，炒香。\",\"8.放入猪蹄，炒香炒脆。\",\"9.倒入南乳，翻炒。\",\"10.加入冰糖，盖上盖子，煮约20分钟。\",\"11.将猪蹄放入冰水浸泡五分钟，捞出。\",\"12.香喷喷的花生南乳猪蹄就做好啦。\"]', '猪手，一直都是减肥人群避而不谈的食材。因为油脂高热量高，怕减重效果不好。但，其实合理的烹饪方式，加上摄入的量控制得好，还是可以吃的。食物多样化，是营养科学一直倡导的饮食结构。所以满满的胶原蛋白猪蹄，你减肥就这么吃吧！', '2', './img/zt.jpg', './img/yh6.jpg', '小肖', '0', '桂圆桂圆又甜又圆');
INSERT INTO `cook_food` VALUES ('7', '减肥版椒盐带鱼', '[{\"food\":\"带鱼\",\"weight\":\"227g\"},\r\n{\"food\":\"面粉\",\"weight\":\"50g\"},\r\n{\"food\":\"椒盐\",\"weight\":\"3ml\"},\r\n{\"food\":\"姜\",\"weight\":\"3片\"},\r\n{\"food\":\"料酒\",\"weight\":\"3ml\"}]', '[\"1.根据食材种类和重量，备好。\",\"2.洗好带鱼，放在大碗，加入盐、部分椒盐（如果是直接买腌制过的带鱼，可以省去这个环节）。\",\"3.搅拌均匀，腌制20分钟，等待入味。\",\"4.把面粉倒洒在平碟上，把带鱼一块块，都沾层薄薄的面粉，等待备用。\",\"5.热锅冷油，等20秒，倒入姜片，炒香。\",\"6.把沾满面粉的带鱼，放入锅内，先煎一面熟，大概需要5分钟。\",\"7.翻面，煎至金黄。\",\"8.慢慢夹出，即可。\"]', '今天特意带来一道“椒盐带鱼”来满足你的胃！这道菜颇有中餐西做的特点，夹起一块，色泽金黄诱人，观感极佳。尝一尝外稣里嫩，鱼香满口。', '2', './img/jfdy.jpg', './img/yh7.jpg', '尜尜', '0', '瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜');
INSERT INTO `cook_food` VALUES ('8', '青瓜拌虾仁', '[{\"food\":\"青瓜\",\"weight\":\"228g\"},\r\n{\"food\":\"虾仁\",\"weight\":\"78g\"},\r\n{\"food\":\"酱油\",\"weight\":\"3ml\"},\r\n{\"food\":\"醋\",\"weight\":\"5ml\"},\r\n{\"food\":\"芝麻香油\",\"weight\":\"5g\"},\r\n{\"food\":\"辣椒\",\"weight\":\"1个\"}\r\n]', '[\"1.按照要求，备好需要的食材。\",\"2.辣椒切小段。\",\"3.青瓜削皮。\",\"4.青瓜切成菱形状的薄片。\",\"5.虾仁白灼好，捞出。\",\"6.拿出大碗，放入切好的青瓜、虾仁和辣椒，并且加入酱油和醋。\",\"7.搅拌均匀。\",\"8.最后淋上芝麻油，在搅拌，就可以啦。\"]', '夏日炎炎，特别想吃凉拌菜，酸辣酸辣的。可是外面的凉拌菜，油脂很高，不太适合减肥人群吃。', '3', './img/qgxr.jpg', './img/yh8.jpg', 'Kiev', '0', '来哟来哦喝酒吃果果，来哟来哦喝酒吃果果，来哟来哦喝酒吃果果，来哟来哦喝酒吃果果');
INSERT INTO `cook_food` VALUES ('9', '鸡胸肉藜麦沙拉', '[{\"food\":\"鸡胸肉\",\"weight\":\"250g\"},{\"food\":\" 白藜麦\",\"weight\":\"30g\"},{\"food\":\"洋葱\",\"weight\":\"30g\"},{\"food\":\"葱\",\"weight\":\"1颗\"},{\"food\":\"香菜\",\"weight\":\"1颗\"},{\"food\":\"蒜\",\"weight\":\"2瓣\"},{\"food\":\"盐\",\"weight\":\"少许\"},{\"food\":\"白胡椒粉\",\"weight\":\"少许\"},{\"food\":\"玉米油\",\"weight\":\"少许\"},{\"food\":\"柠檬\",\"weight\":\"1个\"}]', '[\"1.根据食材的分量和重量，提前备好。\",\"2.鸡肉切成粒块。\",\"3.撒上盐、白胡椒粉，搅拌均匀，腌制3分钟。\",\"4.洋葱切小，辣椒和葱香菜切段，备用。\",\"5.热锅下油，放鸡肉，翻炒。\",\"6.加入蒜头、葱和香菜，再翻炒。\",\"7.放入洋葱，挤出柠檬汁。\",\"8.加入洗好的藜麦，还有30毫升水。\",\"9.煮好即可出锅享用。\"]', '当鸡胸肉遇上藜麦，居然能碰撞出这么新奇的味蕾！！！太好吃了。', '3', './img/jxr.jpg', './img/yh9.jpg', '哥哥', '0', '卖梨子卖梨子十块钱4个，卖梨子卖梨子十块钱4个，卖梨子卖梨子十块钱4个');
INSERT INTO `cook_food` VALUES ('10', '酸奶舒芙蕾', '[\r\n{\"food\":\"低筋粉\",\"weight\":\"50g\"},\r\n{\"food\":\" 鸡蛋\",\"weight\":\"2个\"}, \r\n{\"food\":\"酸奶\",\"weight\":\"125ml\"},\r\n{\"food\":\"牛奶\",\"weight\":\"5ml\"},\r\n{\"food\":\"葡萄\",\"weight\":\"6个\"},\r\n{\"food\":\"黄油\",\"weight\":\"4g\"},\r\n{\"food\":\"代糖\",\"weight\":\"3g\"}\r\n]', '[\"1.根据食材的种类和分量，备好。\",\"2.鸡蛋中蛋黄和蛋清分开，把牛奶加入蛋黄，再加入低筋粉。\",\"3.用搅拌机慢速搅拌。\",\"4.搅拌机头洗净，搽干，打发蛋清。\",\"5.快速搅拌中，分次加入代糖。\",\"6.搅拌至泡沫呈倒三角，即可。\",\"7.倒入打发好的蛋黄，划Z字形，使其均匀。\",\"8.热锅刷油，倒下如饼状。\",\"9.滴一滴水，制造水蒸气，盖起来，即可出锅。\",\"10加入酸奶，摆上切半葡萄，即可享用美味舒芙蕾。\"]', '减肥早餐总是太过单调怎么办？每天都是牛奶+鸡蛋+水果？？今天分享一道你想都不敢想的减肥早餐→酸奶舒芙蕾，超级美味！！', '1', './img/sn.jpg', './img/yh4.jpg', '小雪', '0', '瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜');
INSERT INTO `cook_food` VALUES ('11', '蒜蓉烤白菇', '[\r\n{\"food\":\"白菇\",\"weight\":\"6个\"},\r\n{\"food\":\"培根\",\"weight\":\"1片\"}, \r\n{\"food\":\"盐\",\"weight\":\"少许\"},\r\n{\"food\":\"菜籽油\",\"weight\":\"少许\"},\r\n{\"food\":\"辣椒\",\"weight\":\"1个\"},\r\n{\"food\":\"蒜头\",\"weight\":\"4瓣\"}\r\n]', '[\"1.根据食材的种类和分量，备好。\",\"2.蒜剁碎。\",\"3.辣椒切丁。\",\"4.培根切碎。\",\"5.热锅冷油，爆炒蒜蓉和辣椒。\",\"6.加入培根，搅拌，作为佐料。\",\"7.白菇洗净，去蒂，加入佐料，撒点油滴，烤箱220度，15分钟后即可取出。\"]', '秋天已至，该吃点什么新颖的东西呢？？哇！爽脆的白菇，你吃过吗？特别是烤过的，超级好吃，还能减肥哟～', '2', './img/kbg.jpg', './img/yh6.jpg', '尜尜', '0', '瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜');
INSERT INTO `cook_food` VALUES ('12', '芒果虾仁', '[\r\n{\"food\":\"芒果\",\"weight\":\"1个\"},\r\n{\"food\":\"虾仁\",\"weight\":\"200g\"}, \r\n{\"food\":\"胡萝卜粒\",\"weight\":\"50g\"},\r\n{\"food\":\"豌豆\",\"weight\":\"50g\"},\r\n{\"food\":\"姜\",\"weight\":\"1块\"},\r\n{\"food\":\"牛奶\",\"weight\":\"5ml\"},\r\n{\"food\":\"盐\",\"weight\":\"少许\"},\r\n{\"food\":\"料酒\",\"weight\":\"少许\"},\r\n{\"food\":\"玉米油\",\"weight\":\"适量\"}\r\n]', '[\"1.根据食材的种类和分量，备好。\",\"2.放入各调味料和姜片，搅拌均匀，腌制30分钟。\",\"3.芒果切粒，备用。\",\"4.加入少许牛奶，搅拌。\",\"5.热锅冷油，倒入虾仁。\",\"6.加入豌豆和胡萝卜粒，翻炒。\",\"7.加入剩余的牛奶，翻炒。\",\"8.淋上芒果牛奶，即可。\"]', '当橙黄的芒果与粉嫩的虾仁，搭配在一起，可以碰撞出怎样的火花？今天就分享一道有火花有颜值有营养的“芒果虾仁”，超级好吃，还能减肥！', '3', './img/mgxr.jpg', './img/yh2.jpg', 'Kiev', '0', '瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜，冬瓜冬天吃瓜');

-- ----------------------------
-- Table structure for cook_user
-- ----------------------------
DROP TABLE IF EXISTS `cook_user`;
CREATE TABLE `cook_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `email` varchar(24) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cook_user
-- ----------------------------
INSERT INTO `cook_user` VALUES ('3', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '1', null, null, 'admin');
INSERT INTO `cook_user` VALUES ('4', 'tom', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, 'tom');
INSERT INTO `cook_user` VALUES ('7', '18983848751', '81dc9bdb52d04dc20036dbd8313ed055', '0', null, null, 'tom1');
INSERT INTO `cook_user` VALUES ('8', '17823703748', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, '2');
INSERT INTO `cook_user` VALUES ('9', '18983848750', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, 'tom2');
INSERT INTO `cook_user` VALUES ('10', '18989848785', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, 'tom3');
INSERT INTO `cook_user` VALUES ('11', '17823703746', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, 'tom4');
INSERT INTO `cook_user` VALUES ('12', '13501234567', 'e10adc3949ba59abbe56e057f20f883e', '0', null, null, 'tom5');
INSERT INTO `cook_user` VALUES ('13', '15001234567', 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '123123@qq.com', '小红');

-- ----------------------------
-- Table structure for cook_zan
-- ----------------------------
DROP TABLE IF EXISTS `cook_zan`;
CREATE TABLE `cook_zan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='点赞记录表';

-- ----------------------------
-- Records of cook_zan
-- ----------------------------
INSERT INTO `cook_zan` VALUES ('2', '12', '3');
INSERT INTO `cook_zan` VALUES ('3', '10', '3');
INSERT INTO `cook_zan` VALUES ('4', '12', '1');
INSERT INTO `cook_zan` VALUES ('6', '13', '1');

-- ----------------------------
-- Table structure for food_movie
-- ----------------------------
DROP TABLE IF EXISTS `food_movie`;
CREATE TABLE `food_movie` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `zuoze` varchar(30) DEFAULT NULL,
  `details` varchar(300) DEFAULT NULL,
  `date_time` varchar(15) DEFAULT NULL,
  `movie_img` varchar(20) DEFAULT NULL,
  `movie_url` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of food_movie
-- ----------------------------
INSERT INTO `food_movie` VALUES ('1', '麻油鸡', '美食家大雄君', '[\"1、锅中放水，加入鸡肉，焯水去腥去血沫\",\"2、锅中倒入鸡肉，加盐，麻油\",\"3、电饭煲中放入姜片，放入鸡肉，打入砂锅模式3小时\",\"4、取出切片即可使用\"]', '2018年07月06日 12:', './img/myj.jpg', './movie/myj.mp4');
INSERT INTO `food_movie` VALUES ('2', '西芹百合', '野居青年', '[\"1、西芹300克切段，胡萝卜50克切片\",\"2、食用油5ML，倒入胡萝卜，翻炒均匀，倒入西芹，百合100克，翻炒均匀\",\"3、加入鸡粉2克，盐4克，翻炒均匀\"]', '2019年07月07日 22:', './img/xqbh.jpg', './movie/xqbh.mp4');
INSERT INTO `food_movie` VALUES ('3', '玉米面粥', '野居青年', '[\"1、鸡蛋一个，打散\",\"2、玉米面50克， 清水50ml，搅拌成面糊\",\"3、清水500ml，大火煮沸，倒入面糊，搅拌均匀，倒入蛋液，搅拌均匀，大火煮沸\"]', '2019年06月01日 22:', './img/ypz.jpg', './movie/ypz.mp4');
INSERT INTO `food_movie` VALUES ('4', '鱼片粥', '美食家大雄君', '[\"1、姜丝5克，青菜50克切段，香菜10克切末，草鱼300克切片\",\"2、大米200克，大火煮沸转小火煮30分钟\",\"3、倒入姜丝，放入鱼肉，盐3克，倒入青菜，香菜，香油5克继续煮3分钟\"]', '2018年07月16日 20:', './img/ymmz.jpg', './movie/ymmz.mp4');
INSERT INTO `food_movie` VALUES ('5', '榨菜肉丝汤', '美食大师', '[\"1、芹菜60克切段，姜片4克，瘦肉50克切条\",\"2、清水1升，倒入姜片，瘦肉，搅拌均匀\",\"3、倒入芹菜，盐2克，等待出锅\"]', '2018年07月16日 20:', './img/zcrst.jpg', './movie/zcrst.mp4');
INSERT INTO `food_movie` VALUES ('6', '珍珠翡翠白玉汤', '顶级美味', '[\"1、葱末10克，豆腐200克切丁，娃娃菜100克切段\",\"2、清水500克倒入豆腐，毛豆50克，盐2克，鸡粉3克，大火煮沸\",\"3、倒入娃娃菜，葱末，香油5克，搅拌均匀\"]', '2018年07月16日 20:', './img/zzfcbyt.jpg', './movie/zzfcbyt.mp4');
INSERT INTO `food_movie` VALUES ('7', '紫薯山药糕', '山村淡食', '[\"1、紫薯200克切段，山药150克切段\",\"2、起锅隔水蒸熟，剥皮\",\"3、倒入紫薯，加糖粉10克，捣成泥\",\"4、倒入山药，糖粉10克，捣成泥\",\"5、取山药泥和紫薯泥各25克团成团，取模具按压成型\"]', '2019年06月01日 22:', './img/zssy.jpg', './movie/zssy.mp4');
INSERT INTO `food_movie` VALUES ('8', '左宗棠鸡\r\n左宗棠鸡的做法\r\n', '乡村厨师', '[\"1、鸡腿肉280g切丁，姜片5g，蒜末5g，小米椒适量切段，甜椒20g切块\",\"2、倒入鸡腿肉，蛋黄一个，盐2g，玉米淀粉25g，搅拌均匀\",\"3、放入白砂糖15g，白醋15g，生抽8g，淀粉5g，辣椒油10g搅拌均匀\",\"4、起锅倒入食用油200ml，大火烧至七成熟，放入鸡肉，大火炸至表面金黄\",\"5、另起锅倒入食用油5ml，倒入姜片，蒜末，小米椒，大火爆香\",\"6、倒入鸡肉，翻炒均匀，倒入调料 翻炒均匀，倒入甜椒\"]', '2019年06月01日 22:', './img/zztj.jpg', './movie/zztj.mp4');
