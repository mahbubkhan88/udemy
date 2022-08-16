<?php


/**
* database class
*/
class Database
{

	private function connect()
	{
		$str = DBDRIVER.":hostname=".DBHOST.";dbname=".DBNAME;
		return new PDO($str,DBUSER,DBPASS);

	}

	public function query($query,$data = [],$type = 'object')
	{
		$con = $this->connect();

		$stm = $con->prepare($query);
		if($stm)
		{
			$check = $stm->execute($data);
			if($check)
			{
				if($type == 'object')
				{
					$type = PDO::FETCH_OBJ;
				}else{
					$type = PDO::FETCH_ASSOC;
				}

				$result = $stm->fetchAll($type);

				if(is_array($result) && count($result) > 0)
				{
					return $result;
				}
			}
		}

		return false;
	}

	public function create_tables()
	{
	//users table
		$query = "

		CREATE TABLE IF NOT EXISTS `users` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`firstname` varchar(30) NOT NULL,
			`lastname` varchar(30) NOT NULL,
			`email` varchar(100) NOT NULL,
			`password` varchar(255) NOT NULL,
			`role` varchar(20) NOT NULL,
			`date` date DEFAULT NULL,
			PRIMARY KEY (`id`),
			KEY `firstname` (`firstname`),
			KEY `lastname` (`lastname`),
			KEY `email` (`email`),
			KEY `date` (`date`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

		";

		$this->query($query);

	//insert into users table
		$query = "

		INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `role`, `about`, `company`, `designation`, `country`, `address`, `phone`, `slug`, `image`, `facebook_link`, `instagram_link`, `twitter_link`, `linkedin_link`, `date`) VALUES
		(1, 'Mahbubur', 'Rahman', 'mahbubkhan88@gmail.com', '$2y$10$NDpStIytLo4dqJazGElgEOTyCquakmBcIE5sepTfhxx276Nct4mQW', 'Admin', 'Sunt est soluta temporibus accusantium neque nam maiores cumque temporibus. Tempora libero non est unde veniam est qui dolor.', 'Taseen Group', 'Graphics Designer', 'Bangladesh', '422/2, West Shewrapara, Mirpur, Dhaka-1216', '0987432454', 'mahbubur-rahman', 'uploads/images/1658033041105783-2.jpg', 'https://www.facebook.com/mumtahinacatering', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.linkedin.com', '2022-06-26');

		";

		$this->query($query);


	//courses table
		$query = "

		CREATE TABLE `courses` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`title` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
			`subtitle` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
			`description` text CHARACTER SET utf8mb4 DEFAULT NULL,
			`user_id` int(11) DEFAULT NULL,
			`category_id` int(11) DEFAULT NULL,
			`sub_category_id` int(11) DEFAULT NULL,
			`level_id` int(11) DEFAULT NULL,
			`language_id` int(11) DEFAULT NULL,
			`price_id` int(11) DEFAULT NULL,
			`currency_id` int(11) DEFAULT NULL,
			`promo_link` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
			`welcome_message` varchar(2048) CHARACTER SET utf8mb4 DEFAULT NULL,
			`congratulations_message` varchar(2048) CHARACTER SET utf8mb4 DEFAULT NULL,
			`primary_subject` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
			`course_promo_video` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
			`course_image` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
			`tags` varchar(2048) CHARACTER SET utf8mb4 DEFAULT NULL,
			`approved` tinytext CHARACTER SET utf8mb4 NOT NULL DEFAULT '\'\\\'0\\\'\'',
			`published` tinytext CHARACTER SET utf8mb4 NOT NULL DEFAULT '\'\\\'0\\\'\'',
			`date` datetime DEFAULT NULL,
			PRIMARY KEY (`id`),
			KEY `title` (`title`),
			KEY `user_id` (`user_id`),
			KEY `category_id` (`category_id`),
			KEY `level_id` (`level_id`),
			KEY `sub_category_id` (`sub_category_id`),
			KEY `price_id` (`price_id`),
			KEY `language_id` (`language_id`),
			KEY `primary_subject` (`primary_subject`),
			KEY `date` (`date`),
			KEY `currency_id` (`currency_id`)
			) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4

		";

		$this->query($query);


	//prices table
		$query = "

		CREATE TABLE IF NOT EXISTS `prices` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`name` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
			`price` decimal(10,0) NOT NULL,
			`disabled` tinyint(1) NOT NULL DEFAULT 0,
			PRIMARY KEY (`id`),
			KEY `price` (`price`),
			KEY `disabled` (`disabled`)
			) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4

		";

		$this->query($query);


	//insert into prices table
		$query = "

		INSERT INTO `prices` ('id', 'name', 'price', 'disabled') VALUES ('1', 'Free', '0', 0);

		";

		$this->query($query);

	//currencies table
		$query = "

		CREATE TABLE IF NOT EXISTS `currencies` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`currency` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
			`symbol` varchar(4) CHARACTER SET utf8mb4 NOT NULL,
			`disabled` tinyint(1) NOT NULL DEFAULT 0,
			PRIMARY KEY (`id`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

		";

		$this->query($query);


	//insert into currencies table
		$query = "

		INSERT INTO `currencies` (`id`, `currency`, `symbol`, `disabled`) VALUES
		(1, 'US Doller', '$', 0);

		";

		$this->query($query);


	//levels table
		$query = "

		CREATE TABLE IF NOT EXISTS `levels` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`level` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
			`disabled` tinyint(1) NOT NULL DEFAULT 0,
			PRIMARY KEY (`id`),
			KEY `disabled` (`disabled`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

		";

		$this->query($query);

	//insert into levels table
		$query = "

		INSERT INTO `levels` (`id`, `level`, `disabled`) VALUES
		(1, 'Beginners Level', 0),
		(2, 'Intermediate Level', 0),
		(3, 'Expert Level', 0),
		(4, 'All Levels', 0);

		";

		$this->query($query);


		//categories table
		$query = "

		CREATE TABLE `categories` (
		  `id` int(11) NOT NULL,
		  `category` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
		  `disabled` tinytext NOT NULL DEFAULT '0'
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

		";

		$this->query($query);

	//insert into categories table
		$query = "

		INSERT INTO `categories` (`id`, `category`, `disabled`) VALUES
		(1, 'Development', '0'),
		(2, 'Business', '0'),
		(3, 'Accounting & Finance', '0'),
		(4, 'IT & Software', '0'),
		(5, 'Office Productivity', '0'),
		(6, 'Personal Development', '0'),
		(7, 'Design', '0'),
		(8, 'Marketing', '0'),
		(9, 'Lifestyle', '0'),
		(10, 'Photography & Video', '0'),
		(11, 'Health & Fitness', '0'),
		(12, 'Music', '0'),
		(13, 'Teaching & Academics', '0'),
		(14, 'I don\'t know yet', '0');

		";

		$this->query($query);


	//languages table
		$query = "

		CREATE TABLE IF NOT EXISTS `languages` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`language` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
			`symbol` varchar(30) NOT NULL,
			`disabled` tinyint(1) NOT NULL DEFAULT 0,
			PRIMARY KEY (`id`),
			KEY `disabled` (`disabled`)
			) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4

		";

		$this->query($query);

	//insert into languages table
		$query = "

		INSERT INTO `languages` (`id`, `language`, `symbol`, `disabled`) VALUES
		(1, 'English', 'en', 0),
		(2, 'Afar', 'aa', 0),
		(3, 'Abkhazian', 'ab', 0),
		(4, 'Afrikaans', 'af', 0),
		(5, 'Amharic', 'am', 0),
		(6, 'Arabic', 'ar', 0),
		(7, 'Assamese', 'as', 0),
		(8, 'Aymara', 'ay', 0),
		(9, 'Azerbaijani', 'az', 0),
		(10, 'Bashkir', 'ba', 0),
		(11, 'Belarusian', 'be', 0),
		(12, 'Bulgarian', 'bg', 0),
		(13, 'Bihari', 'bh', 0),
		(14, 'Bislama', 'bi', 0),
		(15, 'Bengali', 'bn', 0),
		(16, 'Tibetan', 'bo', 0),
		(17, 'Breton', 'br', 0),
		(18, 'Catalan', 'ca', 0),
		(19, 'Corsican', 'co', 0),
		(20, 'Czech', 'cs', 0),
		(21, 'Welsh', 'cy', 0),
		(22, 'Danish', 'da', 0),
		(23, 'German', 'de', 0),
		(24, 'Bhutani', 'dz', 0),
		(25, 'Greek', 'el', 0),
		(26, 'Esperanto', 'eo', 0),
		(27, 'Spanish', 'es', 0),
		(28, 'Estonian', 'et', 0),
		(29, 'Basque', 'eu', 0),
		(30, 'Persian', 'fa', 0),
		(31, 'Finnish', 'fi', 0),
		(32, 'Fiji', 'fj', 0),
		(33, 'Faeroese', 'fo', 0),
		(34, 'French', 'fr', 0),
		(35, 'Frisian', 'fy', 0),
		(36, 'Irish', 'ga', 0),
		(37, 'Scots', 'gd', 0),
		(38, 'Galician', 'gl', 0),
		(39, 'Guarani', 'gn', 0),
		(40, 'Gujarati', 'gu', 0),
		(41, 'Hausa', 'ha', 0),
		(42, 'Hindi', 'hi', 0),
		(43, 'Croatian', 'hr', 0),
		(44, 'Hungarian', 'hu', 0),
		(45, 'Armenian', 'hy', 0),
		(46, 'Interlingua', 'ia', 0),
		(47, 'Interlingue', 'ie', 0),
		(48, 'Inupiak', 'ik', 0),
		(49, 'Indonesian', 'in', 0),
		(50, 'Icelandic', 'is', 0),
		(51, 'Italian', 'it', 0),
		(52, 'Hebrew', 'iw', 0),
		(53, 'Japanese', 'ja', 0),
		(54, 'Yiddish', 'ji', 0),
		(55, 'Javanese', 'jw', 0),
		(56, 'Georgian', 'ka', 0),
		(57, 'Kazakh', 'kk', 0),
		(58, 'Greenlandic', 'kl', 0),
		(59, 'Cambodian', 'km', 0),
		(60, 'Kannada', 'kn', 0),
		(61, 'Korean', 'ko', 0),
		(62, 'Kashmiri', 'ks', 0),
		(63, 'Kurdish', 'ku', 0),
		(64, 'Kirghiz', 'ky', 0),
		(65, 'Latin', 'la', 0),
		(66, 'Lingala', 'ln', 0),
		(67, 'Laothian', 'lo', 0),
		(68, 'Lithuanian', 'lt', 0),
		(69, 'Latvian/Lettish', 'lv', 0),
		(70, 'Malagasy', 'mg', 0),
		(71, 'Maori', 'mi', 0),
		(72, 'Macedonian', 'mk', 0),
		(73, 'Malayalam', 'ml', 0),
		(74, 'Mongolian', 'mn', 0),
		(75, 'Moldavian', 'mo', 0),
		(76, 'Marathi', 'mr', 0),
		(77, 'Malay', 'ms', 0),
		(78, 'Maltese', 'mt', 0),
		(79, 'Burmese', 'my', 0),
		(80, 'Nauru', 'na', 0),
		(81, 'Nepali', 'ne', 0),
		(82, 'Dutch', 'nl', 0),
		(83, 'Norwegian', 'no', 0),
		(84, 'Occitan', 'oc', 0),
		(85, 'Oromoor', 'om', 0),
		(86, 'Punjabi', 'pa', 0),
		(87, 'Polish', 'pl', 0),
		(88, 'Pashto/Pushto', 'ps', 0),
		(89, 'Portuguese', 'pt', 0),
		(90, 'Quechua', 'qu', 0),
		(91, 'Rhaeto-Romance', 'rm', 0),
		(92, 'Kirundi', 'rn', 0),
		(93, 'Romanian', 'ro', 0),
		(94, 'Russian', 'ru', 0),
		(95, 'Kinyarwanda', 'rw', 0),
		(96, 'Sanskrit', 'sa', 0),
		(97, 'Sindhi', 'sd', 0),
		(98, 'Sangro', 'sg', 0),
		(99, 'Serbo-Croatian', 'sh', 0),
		(100, 'Singhalese', 'si', 0),
		(101, 'Slovak', 'sk', 0),
		(102, 'Slovenian', 'sl', 0),
		(103, 'Samoan', 'sm', 0),
		(104, 'Shona', 'sn', 0),
		(105, 'Somali', 'so', 0),
		(106, 'Albanian', 'sq', 0),
		(107, 'Serbian', 'sr', 0),
		(108, 'Siswati', 'ss', 0),
		(109, 'Sesotho', 'st', 0),
		(110, 'Sundanese', 'su', 0),
		(111, 'Swedish', 'sv', 0),
		(112, 'Swahili', 'sw', 0),
		(113, 'Tamil', 'ta', 0),
		(114, 'Telugu', 'te', 0),
		(115, 'Tajik', 'tg', 0),
		(116, 'Thai', 'th', 0),
		(117, 'Tigrinya', 'ti', 0),
		(118, 'Turkmen', 'tk', 0),
		(119, 'Tagalog', 'tl', 0),
		(120, 'Setswana', 'tn', 0),
		(121, 'Tonga', 'to', 0),
		(122, 'Turkish', 'tr', 0),
		(123, 'Tsonga', 'ts', 0),
		(124, 'Tatar', 'tt', 0),
		(125, 'Twi', 'tw', 0),
		(126, 'Ukrainian', 'uk', 0),
		(127, 'Urdu', 'ur', 0),
		(128, 'Uzbek', 'uz', 0),
		(129, 'Vietnamese', 'vi', 0),
		(130, 'Volapuk', 'vo', 0),
		(131, 'Wolof', 'wo', 0),
		(132, 'Xhosa', 'xh', 0),
		(133, 'Yoruba', 'yo', 0),
		(134, 'Chinese', 'zh', 0),
		(135, 'Zulu', 'zu', 0);

		";

		$this->query($query);

	}


}