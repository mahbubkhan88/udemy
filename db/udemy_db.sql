-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2022 at 10:07 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udemy_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `disabled` tinytext NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
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
  `csrf_code` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `trending` int(11) NOT NULL DEFAULT 0,
  `welcome_message` varchar(2048) CHARACTER SET utf8mb4 DEFAULT NULL,
  `congratulations_message` varchar(2048) CHARACTER SET utf8mb4 DEFAULT NULL,
  `primary_subject` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `course_promo_video` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
  `course_image` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
  `course_image_tmp` varchar(1024) NOT NULL,
  `tags` varchar(2048) CHARACTER SET utf8mb4 DEFAULT NULL,
  `approved` tinytext CHARACTER SET utf8mb4 NOT NULL DEFAULT '\'\\\'0\\\'\'',
  `published` tinytext CHARACTER SET utf8mb4 NOT NULL DEFAULT '\'\\\'0\\\'\'',
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `subtitle`, `description`, `user_id`, `category_id`, `sub_category_id`, `level_id`, `language_id`, `price_id`, `currency_id`, `promo_link`, `csrf_code`, `views`, `trending`, `welcome_message`, `congratulations_message`, `primary_subject`, `course_promo_video`, `course_image`, `course_image_tmp`, `tags`, `approved`, `published`, `date`) VALUES
(1, 'Create Studio Video Animation and Editing Master Course from Beginner to Expert', 'Video Editing Course', 'Want to create 2d animation marketing videos that sell but you don\'t have the time to learn the complex software programs and processes involved?\r\n\r\nWhy not take the easy and fast route by using CreateStudio easy 2D animation software.  Available on both Windows and MacOS, CreateStudio takes the pain and suffering out of creating 2D animated promotional videos.\r\n\r\nImagine opening a professionally designed template and changing a few words and a logo to quickly produce an eye-catching promotional video for your product or service that actually sells.\r\n\r\nYes, CreateStudio is that easy to use.\r\n\r\nGone is the need to perform character illustration, rigging of bones and complex animation on your own.  CreateStudio makes it easy to use prebuilt 3D characters and actions to produce any video in hours instead of weeks.\r\n\r\nEven though the program has greatly simplified the task of rendering professional-quality 2D animation, it is the most powerful of the \"easy\" 2D animation programs on the market and is packed with features including:\r\n\r\nTemplate-based animation project development\r\n\r\nMade for you 2D and 3D characters\r\n\r\nMade for you character actions for quick and easy animation\r\n\r\nIntegration with Pexels and Pixabay video and images for fast import\r\n\r\nBuilt-in music library and easy animation syncing\r\n\r\nText doodle animation\r\n\r\nText to speech translation for video narration\r\n\r\nUnparalleled text animation and kinetic typography\r\n\r\nEasy to use scene transitions and special effects\r\n\r\nDevice screens, social media icons and lower thirds animation\r\n\r\nVideo, image and audio import and integration\r\n\r\nCasting realistic shadows\r\n\r\nCreateStudio performance improvement\r\n\r\nCreateStudio is probably the least expensive 2D animation solution\r\n\r\nGreat support, Facebook user group and YouTube video tutorials\r\n\r\nIncludes a commercial license allowing you to sell CreateStudio videos to customers\r\n\r\nThis course is directed toward brand new users of CreateStudio.  It moves slowly explaining everything from the basics to the advanced features.  By the end of the course, you\'ll know everything there is to know about CreateStudio.\r\n\r\nExperienced CreateStudio users will be bored watching the entire course but will still find important usage tips and techniques to bring their knowledge to the next level.\r\n\r\nAt this point, I think you\'ve got to ask yourself: \"What have I got to lose.\"  Especially considering how much you have to gain.\r\n\r\nCreateStudio is inexpensive and risk-free, providing a 30-day money-back guaranty.\r\n\r\nWhy don\'t you watch the over one hour of free preview lectures in this course, then take the plunge?  I promise you won\'t be sorry; and if you are, simply return the program for a full refund.\r\n\r\nDon\'t wait!  The clock is ticking.\r\n\r\nEnroll now!\r\n\r\nWho this course is for:\r\nIndividuals who are brand new to 2D animation\r\nIndividuals who have been frustrated trying to use complex 2D animation software\r\nIndividuals who want the perfect balance of performance and features vs simplicity and ease of use', 1, 10, 0, 3, 1, 1, 0, NULL, '3f691296dd80cad662153526c8f0ad65', 0, 0, NULL, NULL, 'Video Editing', '', 'uploads/courses/16604647123330300_New Project - 2022-05-29T085850.514.jpg', '', NULL, '0', '0', '2022-07-18 06:57:53'),
(2, 'Social Media Content Creation Canva Beginner to Advanced', 'Graphics Design Course', 'Are you ready to create something remarkable today?\r\n\r\nWhether you\'re a beginner looking for some guidance on basic graphic creation, or an expert looking to pick up some new tricks - there is something in this course just for you!\r\n\r\n\r\n\r\nWhat can you expect?\r\n\r\nThis course is packed full of exciting, valuable lessons that teach you exactly how to create beautiful graphics that will help turn your online presence into something truly remarkable. It\'s taught using follow-along videos where I\'ll be sharing my screen, so you can create your own projects at your own pace as you watch! Plus, I\'ll provide you with my custom, downloadable, mobile-friendly templates to ensure that each graphic you create is going to look fabulous on mobile too.\r\n\r\nWe will be using the Pro (Paid) version of Canva for this course but I will also be showing you how to get around some of the premium features for those of you who will be using the free plan of Canva by using some clever hacks and external helpful tools.\r\n\r\n\r\n\r\nBy the end of this course, you\'ll be able to make your own:\r\n\r\nCanva graphics to use anywhere online and offline for print\r\n\r\nInstagram inspirational quote graphics, multi-post carousel images\r\n\r\nSharable GIFs and meme posts\r\n\r\nFacebook graphics and banners for your business page\r\n\r\nAnimated Pinterest pins\r\n\r\nYouTube channel art, video thumbnails and animated end screens\r\n\r\nBusiness materials including eBooks, mockups and business cards\r\n\r\nSimple websites for yourself or clients\r\n\r\nWho this course is for:\r\nAnyone who wants to learn how to design amazing graphics and videos for their social media platforms, their website or their business\r\nBusiness owners who want to learn how to design their own simple websites, business cards and eBooks\r\nFreelancers who want to take their design skills up a notch without needing to learn expensive software\r\nAnyone who wants to learn some awesome Canva design hacks!', 1, 7, 0, 3, 1, 1, 1, NULL, '8229528df7325ee278204ebcdc644c77', 0, 0, NULL, NULL, 'Graphics Design', '', 'uploads/courses/1660464606post-s.jpg', '', NULL, '0', '0', '2022-07-18 07:04:31'),
(3, 'The English Master Course English Grammar English Speaking', 'English Master Course', 'The English Master Course: Learn English Grammar, English Speaking, English Punctuation.\r\n\r\nAre you ready to master the English language? Are you tired of learning the same simple topics and never really getting better at English speaking or English grammar? This course will fix all those problems. This has been one of the top Udemy English courses for many years, and that is because we care about our students.\r\n\r\nThe English master course covers all areas of English learning. English grammar, English speaking, and English writing (punctuation). There are over 35 hours of video lessons, hundreds of examples and practice problems, and full-length PDFs.\r\n\r\nThis course is HUGE. Basically 3 courses in 1.\r\n\r\nEnglish Grammar Section: Over 90 different English grammar topics. No other course covers as many English Grammar topics. Full video lessons and conversations showing you the English grammar in use. You will learn to score higher on your English exams like TOEIC, IELTS, or TOEFL. Hundred of practice problems and examples. Full-length PDFs for offline learning.\r\n\r\nEnglish Speaking Section: Learn to speak like a native English speaker. Learn how to talk about 27 different topics. Learn hundreds of new English vocabulary, verbs, and phrases. Improve your accent and gain confidence while speaking. Includes American and British audio so you can pick which accent to learn. 75 full-length real conversations with native English speakers allowing you to truly master the English language.\r\n\r\nEnglish Writing Section: Learn the grammar behind English sentences and their different structures. Master all 14 English punctuation marks so you can write better and more professionally. Get that new job you want or better grades in school. Hundreds of examples and writing practice problems. Full-length PDFs and video lessons.\r\n\r\nAfter using this course, you will ace those tough English grammar tests such as A1, A2, B1, B2, C1, TOEFL, IETLS, AND TOEIC. You will sound more professional at work and may even get that new job or promotion you want. You will impress people with your new advanced English level. Your English grammar, English speaking, and English writing will all improve. You will develop a British or American accent and sound fluent.\r\n\r\nStudents love this course. See what some of them have to say about it:\r\n\r\nVerberly C.\r\n\r\n***** - 5 stars\r\n\r\n\"I have been using Course for success for over 2 years now, it was relevant then and even more so now, I always refer now and again to refresh my skills. The instructions are lessons are easy to follow and I am happy to be able to learn at my own pace.\"\r\n\r\nSandesh K\r\n\r\n***** - 5 stars\r\n\r\n\"I\'m a newbie in this course and really enjoying it. The best part is that the instructor is always there to answer your question don\'t matter how many times you ask.\"\r\n\r\nThis is a SUPER course. 3 full courses in 1. You get English grammar, English speaking, and English writing.\r\n\r\nGreat for all levels. Beginners, intermediate, and advanced.\r\n\r\nI guarantee everything you need to become a PRO English language user is in this English master Course. This is the only course that teaches you English grammar in use and also shows you how to use it in real English speaking and conversation so you can improve all areas of the English language.\r\n\r\nEvery topic has dozens of useful English examples, video lectures, guided practice, and real-life English conversations. Hundreds of worksheet pdfs full of practice problems to help you learn the English language.\r\n\r\nThe creator of this course is a real-life university professor and will answer any questions you have 24/7. Start learning English the easy way! Add the course to your cart and we can begin.\r\n\r\n-----------------\r\n\r\nMessage from Scott, the course creator:\r\n\r\nHello, all native English language enthusiasts with the zeal to learn English grammar, use punctuation marks for writing, and become the best at speaking English. I welcome you all to my course page. I have been teaching the English language for many years and have seen most people are still insecure about their use of English. It is possible to master English grammar and English speaking. I will help you be confident when you speak and write.\r\n\r\nThis English language course is the perfect tool for anyone who wants to scale through every phase of English learning seamlessly. Ideal for anyone interested in information regarding the English language â€“ how to learn English â€“ English grammar â€“ spoken English â€“ English speaking â€“ English writing â€“ and English punctuation. I am happy to share my course with you and be part of your journey to be fluent in English grammar, English speaking, and English writing.\r\n\r\nWith all my experience teaching English language students from basic to the advanced level, I will guide you through the journey of mastering English grammar, speaking, and writing.\r\n\r\nI hope to see you all in the course.\r\n\r\nGood luck!\r\n\r\nLangpill | Learn English | Speaking | Listening | Writing\r\n\r\n\r\n\r\nWho this course is for:\r\nAnyone who wants to master English grammar, improve their English speaking and English writing, and feel confident with the English language.', 1, 6, 1, 2, 1, 2, 1, NULL, 'dc0e95e6fbc2935149620eec9de27773', 0, 0, NULL, NULL, 'Learning English', '', 'uploads/courses/1660464470maxresdefault (1).jpg', '', NULL, '0', '0', '2022-07-18 07:14:17'),
(4, 'The Complete DISC Personality Masterclass - You & Them', 'Personal Development Course', 'This DISC course is the only one on this platform specifically designed for the practical application of understanding personality types (DISC personality development model)\r\n\r\n\"Explanations were clear and made sense. Good use of examples to illustrate.\" - Sen Foong Lau Ah Wing\r\n\r\n\r\n\r\nUnderstanding personality types and being able to tailor your communication is critical for two reasons:\r\n\r\nFirst, people are deaf for your arguments, unless they feel that you \"understand\" them.  Second,  personality type communication is a powerful skill, that creates added value for your career, your personal life and your team - few people are good communicators (but most people believe they are - would you agree?)\r\n\r\n\r\n\r\nThus, after having taken this DISC course you will be able to\r\n\r\nUnderstand in an instant which personality type any person has\r\n\r\nKnow the strengths and weaknesses of your own personality and how to use that to your advantage\r\n\r\nAssess the right strategy for persuading and influencing different personalities and off the job\r\n\r\nThis ability will enable you to\r\n\r\nMarket your personal brand, your start-up, your ideas in an effective, tailored way\r\n\r\nPersuade and sell your product or service with tailored messaging\r\n\r\nFeel confident in communicating with anyone about anything\r\n\r\nThis DISC course is for anyone who wants to understand personality types - and go beyond merely understanding, but actually applying the skill in practice. It is the prerequisite to become great at\r\n\r\nCommunication\r\n\r\nPsychology\r\n\r\nMarketing & sales\r\n\r\nFinally, ultra-effective cognitive biases are explained and how to harness their power for written and spoken communication in order to persuade, influence and make yourself stand out in the marketplace. This DISC course has been taken by thousands of successful businesspeople around the globe.\r\n\r\n\"The course is very intuitive and loaded with knowledge. It is great to see that you implement examples that people can relate to. Now I just need to Practice, Practice, Practice!\" - Tony Knight\r\n\r\nWho this course is for:\r\nYou who is interested in different personality types\r\nYou who knows that tailoring communication works in your favor\r\nYou who is curious in becoming a social magnet or great networker', 1, 6, 0, 2, 1, 1, 1, NULL, '89a0ecb9e0f7881027e57bbdb34506b1', 0, 0, NULL, NULL, 'Personal Development', '', 'uploads/courses/1660464333What-is-Personal-Development.jpg', '', NULL, '0', '0', '2022-07-18 07:17:56'),
(5, 'Java Programming Masterclass covering Java Eleven and Twelve', 'Java Programming Course', 'Youâ€™ve just stumbled upon the most complete, in-depth Java programming course online. With close to 600,000 students enrolled and over one hundred and forty thousand reviews (with tens of thousands of those 5-star) to date, these comprehensive java tutorials cover everything youâ€™ll ever need.\r\n\r\nWhether you want to:\r\n\r\n- build the skills you need to get your first Java programming job\r\n\r\n- move to a more senior software developer position\r\n\r\n- pass the oracle java certification exam\r\n\r\n- or just learn java to be able to create your own java apps quickly.\r\n\r\n...this complete Java Masterclass is the course you need to do all of this, and more.\r\n\r\nN.B. Java 17 support coming soon, read on below...\r\n\r\n\r\nAre you aiming to get your first Java Programming job but struggling to find out what skills employers want and which course will give you those skills?\r\n\r\nThis course is designed to give you the Java skills you need to get a job as a Java developer.  By the end of the course, you will understand Java extremely well and be able to build your own Java apps and be productive as a software developer.\r\n\r\nLots of students have been successful in getting their first job or promotion after going through the course.\r\n\r\nHere is just one example of a student who lost her job and despite having never coded in her life previously, got a full-time software developer position in just a few months after starting this course.  She didn\'t even complete the course!\r\n\r\n\r\n\"Three months ago I lost my job, came to a turning point in my life, and finally made the drastic decision to completely change course.   I decided to switch career paths and go into coding. My husband found and gave me your Complete Java Masterclass at Udemy as a gift, and I wholeheartedly dove into it as a lifeline. Following your course has been absolutely enjoyable (still working on it, not yet finished), and has been a great way of keeping on course, dedicated and motivated.  Yesterday, three months after starting the course, and honestly to my surprise, I received (and accepted!) a job offer as a full-time developer. I wanted to just drop you a line to say thank you for doing this work, for being such a dedicated teacher, and for putting all this knowledge available out there in such an approachable way. It has, literally, been life-changing. With gratitude,  Laura\"\r\n\r\n\r\nThe course is a whopping 80 hours long.  Perhaps you have looked at the size of the course and are feeling a little overwhelmed at the prospect of finding time to complete it.   Maybe you are wondering if you need to go through it all?\r\n\r\nFirstly, Laura\'s story above shows that you do not have to complete the entire course - she was yet to complete the course when she accepted her developer job offer.\r\n\r\nSecondly, the course is designed as a one-stop shop for Java.\r\n\r\nThe core java material you need to learn java development is covered in the first seven sections (around 14 hours in total).  The Java Basics are covered in those sections. The rest of the course covers intermediate, advanced, and optional material you do not technically need to go through.\r\n\r\nFor example section 13 is a whopping 10 hours just by itself and is aimed at those students who want to build desktop applications with graphical user interfaces.  JavaFX (which is the technology used in this section) is something that most java developers will rarely or never need to work on.  So you could skip that section entirely.  But if you are one of the few that need to build user interfaces, then the content is there and ready for you.   And there are other sections you can completely avoid if you wish.\r\n\r\nIf you want to know absolutely everything about Java, then you can go through the entire course if you wish, but it\'s not necessary to do so if you are just looking to learn the essential information to get a java developer position.\r\n\r\nWhy would you choose to learn Java?\r\n\r\nThe reality is that there is a lot of computer languages out there.  It\'s in the hundreds.  Why would you choose the Java language?\r\n\r\nThe number one reason is its popularity.  According to many official websites that track the popularity of languages, Java is either #1 or in the top 3.  Popularity means more companies and their staff are using it, so there are more career opportunities available for you if you are skilled in the language.\r\n\r\nThe last thing you want to do is pick a language that is not in mainstream use.  Java came out in the 1990s and is still very popular today.\r\n\r\nWhat version of Java should you learn?\r\n\r\nGenerally speaking, you would want to learn the very latest version of a computer programming language, but that\'s not the case with Java.\r\n\r\nOracle, the owner of Java release many versions of Java.  Some are released and expire in six months, with no future updates or support.  Other versions have long-term support, for many years.\r\n\r\nYou can probably see why learning a version of Java that has expired makes no sense, and is likely a waste of time.\r\n\r\nA company using Java technology (big or small) is not going to use a version of Java that has no updates or support.  They will stick to stable, well-supported versions of Java that get updates.\r\n\r\nRight now, in July 21 the version of Java that offers this long-term support (LTS) is Java 11 - It\'s being fully supported until at least 2025 and likely will be extended from there.\r\n\r\nAs such, you want to learn the version of Java that your future employer will use, and that\'s Java 11.\r\n\r\nThe next LTS version of Java is Java 17, scheduled for release in September 2021.   The course will be updated, and the updates made available to you free once Java 17 is live.  The course will also be updated in the future as new LTS versions are announced by Oracle.\r\n\r\nBOTTOM LINE: You will learn the RIGHT VERSION of JAVA in this course!  Right meaning the right version to maximize your future Java potential with clients or Employers.\r\n\r\n\r\nWill this course give me core java skills?\r\n\r\nYes, it will.  Core Java is the fundamental part of the Java JDK (the java development kit) that programmers need to learn to move onto other more advanced technologies.\r\n\r\nWhy should you take this course?\r\n\r\nIt\'s been a best-seller since its release on Udemy, you would be joining close to 600,000 students who are already enrolled in the course.\r\n\r\nThere are well over 140,000 reviews left by students.  It\'s rated as the best course to learn Java for beginners.\r\n\r\nWhat makes this course a bestseller?\r\n\r\nLike you, thousands of others were frustrated and fed up with fragmented Youtube tutorials or incomplete or outdated courses which assume you already know a bunch of stuff, as well as thick, college-like textbooks able to send even the most caffeine-fuelled coder to sleep.\r\n\r\nLike you, they were tired of low-quality lessons, poorly explained topics, and confusing info presented in the wrong way. Thatâ€™s why so many find success in this complete Java developer course. Itâ€™s designed with simplicity and seamless progression in mind through its content.\r\n\r\nThis course assumes no previous coding experience and takes you from absolute beginner core concepts, like showing you the free tools you need to download and install, to writing your very first Java program.  You will learn the core java skills you need to become employable in around 14 hours, and if you choose to, can take advantage of all the additional content in the course. It\'s a one-stop shop to learn java. If you want to go beyond the core content you can do so at any time.\r\n\r\nHereâ€™s just some of what youâ€™ll learn\r\n\r\n(Itâ€™s okay if you donâ€™t understand all this yet, you will in the course)\r\n\r\nAll the essential Java keywords, operators, statements, and expressions needed to fully understand exactly what youâ€™re coding and why - making programming easy to grasp and less frustrating\r\n\r\nYou will learn the answers to questions like What is a Java class, What is polymorphism and inheritance and to apply them to your java apps.\r\n\r\nHow to safely download and install all necessary coding tools with less time and no frustrating installations or setups\r\n\r\nComplete chapters on object-oriented programming and many aspects of the Java API (the protocols and tools for building applications) so you can code for all platforms and derestrict your programâ€™s user base (and potential sales)\r\n\r\nHow to develop powerful Java applications using one of the most powerful Integrated Development Environments on the market, IntelliJ IDEA! - Meaning you can code functional programs easier.  IntelliJ has both a FREE and PAID version, and you can use either in this course.\r\n\r\n(Donâ€™t worry if youâ€™re used to using Eclipse, NetBeans, or some other IDE. Youâ€™re free to use any IDE and still get the most out of this course)\r\n\r\nLearn Java to a sufficient level to be a be to transition to core Java technologies like Android development, the Spring framework, Java EE (Enterprise edition) in general as well as and other technologies. In order to progress to these technologies, you need to first learn core Java - the fundamental building blocks.  That\'s what this course will help you to achieve.\r\n\r\nâ€œAP-what?â€\r\n\r\nDon\'t worry if none of that made sense. I go into great detail explaining each and every core concept, programming term, and buzzwords you need to create your own Java programs.\r\n\r\nThis truly is Java for complete beginners.\r\n\r\nBy the end of this comprehensive course, youâ€™ll master Java programming no matter what level of experience youâ€™re at right now. Youâ€™ll understand what you are doing, and why you are doing it. This isnâ€™t a recipe book, youâ€™ll use your own creativity to make unique, intuitive programs.\r\n\r\nNot only do these HD videos show you how to become a programmer in great detail, but this course includes a unique challenge feature. Each time a core concept is taught, a video presents a challenge for you to help you understand what you have just learned in a real-world scenario.\r\n\r\nYouâ€™ll go and complete the challenge on your own, then come back and see the answers which I then explain in detail in a video, allowing you to check your results and identify any areas you need to go back and work on.\r\n\r\nThis is a proven way to help you understand Java faster and ensure you reach your goal of becoming a Java Developer in record time. Remember doing those old past exam papers in high school or college? Itâ€™s the same concept, and it works.\r\n\r\nAs your instructor, I have close to  40 years of experience as a software developer and teacher and have been using Java since the year 2000. Yes, over 21 years (Iâ€™ve taught students younger than that). Meaning not only can I teach this content with great simplicity, but I can make it fun too!\r\n\r\nItâ€™s no surprise my previous students have amazing results...\r\n\r\nSee what your fellow students have to say:\r\n\r\n\"This course was a guiding light in my \"Becoming a developer\" path from the first step. It helped me become a much more educated developer comparing to my friend who learned to code from trial/error. It\'s still a guide for me. every now and then I will come back to this course to learn something new or to improve what I\'ve learned somewhere else. A BIG Thanks to \"Tim Buchalka\" my Master.\" - Sina Jz\r\n\r\n\"I was an absolute beginner when I started this course, and now I can write some good small advanced clean codes. I wrote a code and showed it to a programmer, and he was shocked, he told me that I\'m more than ready to start a programming career.\" - Amirreza Moeini\r\n\r\n\"I am taking this class in conjunction with a Java 101 college class. I have learned more in one afternoon of videos from this class than I have in 4 weeks of a college class. Tim actually explains what things are and why they do what they do, as opposed to my college instructor that mainly said \"go make a program that does *whatever*\" and then I had to figure out a program that would meet those requirements but not actually learning why it worked.\" - Stacy Harris\r\n\r\nItâ€™s safe to say my students are thrilled with this course, and more importantly, their results, and you can be tooâ€¦\r\n\r\nThis complete Java course will teach you everything you need to know in order to code awesome, profitable projects,\r\n\r\nIs the course updated?\r\n\r\nItâ€™s no secret how technology is advancing at a rapid rate. New, more powerful hardware and software are being released every day, meaning itâ€™s crucial to stay on top with the latest knowledge.\r\n\r\nA lot of other courses on Udemy get released once, and never get updated.  Learning an older version of Java can be counterproductive - you could be learning the \"old way\" of doing things, rather than using current technology.\r\n\r\nMake sure you check the last updated date on the page of any course you plan to buy - you will be shocked to see some have not been updated for years. \r\n\r\nThatâ€™s why Iâ€™m always adding new, up-to-date content to this course at no extra charge. Buy this course once, and youâ€™ll have lifetime access to it and any future updates (which are on the way as we speak).\r\n\r\nI\'ve continued to do this since the original version of the course came out, and recently have been updating it to Java 11.  And again, once Java 17 is live, I\'ll be on the update trail again, to Java 17.\r\n\r\nWith this complete Java Masterclass, you will always have updated, relevant content.\r\n\r\nWhat if I have questions?\r\n\r\nAs if this course wasnâ€™t complete enough, I offer full support, answering any questions you have 7 days a week (whereas many instructors answer just once per week, or not at all).\r\n\r\nThis means youâ€™ll never find yourself stuck on one lesson for days on end. With my hand-holding guidance, youâ€™ll progress smoothly through this course without any major roadblocks.\r\n\r\nStudent Quote: â€œThis course is a great place to ask questions if you have them or find help if you become stuck in areas.â€ - Blake S.\r\n\r\nThereâ€™s no risk either!\r\n\r\nThis course comes with a full 30-day money-back guarantee. Meaning if you are not completely satisfied with the course or your progress, simply let me know and Iâ€™ll refund you 100%, every last penny no questions asked.\r\n\r\nYou either end up with Java skills, go on to develop great programs and potentially make an awesome career for yourself, or you try the course and simply get all your money back if you donâ€™t like itâ€¦\r\n\r\nYou literally canâ€™t lose.\r\n\r\nReady to get started, developer?\r\n\r\nEnroll now using the â€œAdd to Cartâ€ button on the right, and get started on your way to creative, advanced Java brilliance. Or, take this course for a free spin using the preview feature, so you know youâ€™re 100% certain this course is for you.\r\n\r\nSee you on the inside (hurry, Java class is waiting!)\r\n\r\nWho this course is for:\r\nThis course is perfect for absolute beginners with no previous coding experience, to intermediates looking to sharpen their skills to the expert level.\r\nThose looking to build creative and advanced Java apps for either personal use or for high-paying clients as a self-employed contractor.\r\nThose who love letting their own creative genius shine, whilst getting paid handsome amounts to do so.', 1, 4, 0, 3, 1, 1, 1, NULL, '750523dddd49a2636eca862d2c555147', 0, 0, NULL, NULL, 'Java Programming', '', 'uploads/courses/1660464993maxresdefault (2).jpg', '', NULL, '0', '0', '2022-07-18 07:19:40'),
(6, 'Learning Python for Data Analysis and Visualization', 'Python for Data Analysis Course', 'This course will give you the resources to learn python and effectively use it analyze and visualize data! Start your career in Data Science!\r\n\r\n    You\'ll get a full understanding of how to program with Python and how to use it in conjunction with scientific computing modules and libraries to analyze data. \r\n\r\n  You will also get lifetime access to over 100 example python code notebooks, new and updated videos, as well as future additions of various data analysis projects that you can use for a portfolio to show future employers! \r\n\r\n    By the end of this course you will: \r\n\r\n  - Have an understanding of how to program in Python. \r\n\r\n  - Know how to create and manipulate arrays using numpy and Python. \r\n\r\n  - Know how to use pandas to create and analyze data sets. \r\n\r\n  - Know how to use matplotlib and seaborn libraries to create beautiful data visualization. \r\n\r\n  - Have an amazing portfolio of example python data analysis projects! \r\n\r\n- Have an understanding of Machine Learning and SciKit Learn!\r\n\r\n  With 100+ lectures and over 20 hours of information and more than 100 example python code notebooks, you will be excellently prepared for a future in data science! ', 1, 4, 0, 3, 1, 2, 3, NULL, 'b41df152e2ebe3fcacf2f2e33559a8cd', 0, 0, NULL, NULL, 'Python for Data Analysis', '', 'uploads/courses/1660464221top-5-vscode-extensions-for-python-programming.jpg', '', NULL, '0', '0', '2022-07-18 07:21:46'),
(7, 'The Complete Web Development Bootcamp', 'Web Development Bootcamp Course', 'Welcome to the Complete Web Development Bootcamp, the only course you need to learn to code and become a full-stack web developer. With 150,000+ ratings and a 4.8 average, my Web Development course is one of the HIGHEST RATED courses in the history of Udemy! \r\n\r\nAt 65+ hours, this Web Development course is without a doubt the most comprehensive web development course available online. Even if you have zero programming experience, this course will take you from beginner to mastery. Here\'s why:\r\n\r\nThe course is taught by the lead instructor at the App Brewery, London\'s leading in-person programming bootcamp.\r\n\r\nThe course has been updated to be 2022 ready and you\'ll be learning the latest tools and technologies used at large companies such as Apple, Google and Netflix.\r\n\r\nThis course doesn\'t cut any corners, there are beautiful animated explanation videos and tens of real-world projects which you will get to build.\r\n\r\nThe curriculum was developed over a period of four years, with comprehensive student testing and feedback.\r\n\r\nWe\'ve taught over a million students how to code and many have gone on to change their lives by becoming professional developers or starting their own tech startup.\r\n\r\nYou\'ll save yourself over $12,000 by enrolling, but still get access to the same teaching materials and learn from the same instructor and curriculum as our in-person programming bootcamp.\r\n\r\nThe course is constantly updated with new content, with new projects and modules determined by students - that\'s you!\r\n\r\n\r\n\r\nWe\'ll take you step-by-step through engaging video tutorials and teach you everything you need to know to succeed as a web developer.\r\n\r\nThe course includes over 65 hours of HD video tutorials and builds your programming knowledge while making real-world websites and web apps.\r\n\r\n\r\n\r\nThroughout this comprehensive course, we cover a massive amount of tools and technologies, including:\r\n\r\nFront-End Web Development\r\n\r\nHTML 5\r\n\r\nCSS 3\r\n\r\nBootstrap 4\r\n\r\nJavascript ES6\r\n\r\nDOM Manipulation\r\n\r\njQuery\r\n\r\nBash Command Line\r\n\r\nGit, GitHub and Version Control\r\n\r\nBackend Web Development\r\n\r\nNode.js\r\n\r\nNPM\r\n\r\nExpress.js\r\n\r\nEJS\r\n\r\nREST\r\n\r\nAPIs\r\n\r\nDatabases\r\n\r\nSQL\r\n\r\nMongoDB\r\n\r\nMongoose\r\n\r\nAuthentication\r\n\r\nFirebase\r\n\r\nReact.js\r\n\r\nReact Hooks\r\n\r\nWeb Design\r\n\r\nDeployment with GitHub Pages, Heroku and MongoDB Atlas\r\n\r\nWeb3 Development on the Internet Computer\r\n\r\nBlockchain technology\r\n\r\nToken contract development\r\n\r\nNFT minting, buying and selling logic\r\n\r\nBy the end of this course, you will be fluently programming and be ready to make any website you can dream of.\r\n\r\nYou\'ll also build a portfolio of over 32+ websites that you can show off to any potential employer.\r\n\r\nSign up today, and look forward to:\r\n\r\nAnimated Video Lectures\r\n\r\nCode Challenges and Coding Exercises\r\n\r\nBeautiful Real-World Projects\r\n\r\nQuizzes & Practice Tests\r\n\r\nDownloadable Programming Resources and Cheatsheets\r\n\r\nOur best selling 12 Rules to Learn to Code eBook\r\n\r\n$12,000+ worth of web development bootcamp course materials and course curriculum\r\n\r\n\r\n\r\nDon\'t just take my word for it, check out what existing students have to say about the course:\r\n\r\n\"Angela is just incredible, awesome and just fantastic in this course. I\'ve never had such an instructor; detailed in every aspect of the course, gives precise explanations, gives you the anxiety to learn etc. She\'s got that ability to make fun while explaining things for better understanding. I really love this course.\" - Ekeu MonkamUlrich\r\n\r\n\"Angela is very thorough without ever being boring. I\'ve taken MANY online courses in my life including my Bachelors and Masters degrees. She is by far the best instructor I\'ve ever had. This course is packed with thousands of dollars worth of great instruction, and paced well enough for anyone to pick coding up and run with it- Thank you!\" - J Carlucci\r\n\r\n\"Love the way Angela explains things. Easy to follow and full of logic. I can say she must have spent a lot of energy creating this great course. Thank you and I recommend it to all who\'s interested in coding!\" - Yiqing Zheng\r\n\r\n\"So far (on my third day) this course has taught me more than I was able to learn in multiple other programming courses. This course is clearly outlined and builds upon itself gradually in an easy to understand way.\" - Normal Ramsey\r\n\r\n\"This course will take you from beginner to intermediate level for real. If you don\'t know how to put together the pieces of web development this is what you\'re looking for. Angela explains in an amazing way by creating projects all the way during this course, explaining the concepts in real practice. Thank you very much, Angela. I will always consider you my mentor. Look forward to taking more courses with you.\" - Moises Dionisio Cruz\r\n\r\n\"An amazing course, perfect for absolute beginners at the start of their coding journey! Angela is an amazing tutor and can explain in the most simple and comprehensible way even complex coding notions. Learning web development cannot get any more fun!\" - Zoe Moyssoglou\r\n\r\n\"It\'s a different approach to teaching Web Development. I like that you are given everything possible to succeed from the onset.\" - Ronick Thomas\r\n\r\nThe tutor is simply AMAZING, by far the best tutor I have ever had. I would give her 10 stars out of 5. She is not just punching the code and talking to herself, but she is actually explaining things. She keeps on giving really useful hints and she will give you a great load of other references. I always knew what I was doing and why I was doing it. All the extra challenges have just made me remember and understand things better. - Peter Dlugos\r\n\r\n\r\n\r\n\r\n\r\nREMEMBERâ€¦ I\'m so confident that you\'ll love this course that we\'re offering a FULL money-back guarantee for 30 days! So it\'s a complete no-brainer, sign up today with ZERO risk and EVERYTHING to gain.\r\n\r\nSo what are you waiting for? Click the buy now button and join the world\'s highest-rated web development course.\r\n\r\nWho this course is for:\r\nIf you want to learn to code through building fun and useful projects, then take this course.\r\nIf you want to start your own startup by building your own websites and web apps.\r\nIf you are a seasoned programmer, then take this course to to get up to speed quickly with the latest frameworks and NodeJS\r\nIf you want to take ONE COURSE and learn everything you need to know about web development, take this course.', 1, 4, 0, 3, 1, 2, 1, NULL, '0f4cae4e8916fb954acec3ff496da9cd', 0, 0, NULL, NULL, 'Web Development Bootcamp', '', 'uploads/courses/1660464184images.png', '', NULL, '0', '0', '2022-07-18 07:25:02'),
(8, 'Build Responsive Real World Websites with HTML and CSS', 'Build Responsive Websites with HTML and CSS Course', '*** The #1 bestselling HTML and CSS course on Udemy! ***\r\n\r\n*** Completely re-built from scratch in July 2021 (35+ hours video) ***\r\n\r\n\"Having gone through other related courses on other platforms, I can say this course is the most practical and readily applicable course on web design and development I have taken.\" â€” Bernie Pacis\r\n\r\n\r\n\r\nOpen a new browser tab, type in www.omnifood.dev, and take a look around. I will wait here...\r\n\r\n...\r\n\r\nAmazing, right? What if you knew exactly how to design and build a website like that, completely from scratch? How amazing would that be?\r\n\r\nWell, I\'m here to teach you HTML, CSS, and web design, all by building the stunning website that you just saw, step-by-step.\r\n\r\nSo, after finishing this course, you will know exactly how to build a beautiful, professional, and ready-to-launch website just like Omnifood, by following a 7-step process. And it will even look great on any computer, tablet, and smartphone.\r\n\r\nBut what if you want to build a completely different website? Well, no problem! I designed the course curriculum with exactly this goal: to enable you to design and build any website that you can think of, not just copy the course project.\r\n\r\n\r\n\r\nSo, in order to become a confident and independent developer, capable of building your own websites in the future, you will learn:\r\n\r\nThe fundamentals of modern and semantic HTML, CSS, and building layouts in a small separate project, which will prepare you for the main course project (www.omnifood.dev). This includes modern flexbox and CSS Grid!\r\n\r\nHow to design beautiful websites, by learning a web design framework I created just for this course. It consists of easy-to-use guidelines for design aspects like typography, colors, images, spacing, and more (this is like a small standalone course!).\r\n\r\nHow to use well-established website components and layout patterns in order to come up with professional-looking designs\r\n\r\nHow to make any website work on any mobile device, no matter the design and layout (responsive design)\r\n\r\nHow to use the 7 steps of building a professional website in practice: planning, sketching, designing, building, testing, optimizing, and launching\r\n\r\nHow to find and use free design assets such as images, fonts, and icons\r\n\r\nImportant developer skills such as reading documentation, fixing code errors on your own, and using professional web development tools\r\n\r\nDoes this sound like fun? Then join me and 200,000+ other developers and start building websites today!\r\n\r\nOr are you not sold yet and need to know more? No problem, just keep reading...\r\n\r\n\r\n\r\n[01] Why should you learn HTML and CSS in the first place?\r\n\r\nBuilding websites allows you to do fun and creative work, from anywhere in the world, and it even pays well. Web development is one of the most future-proof and highest-paying industries in the world. And HTML and CSS is the entry point to this world!\r\n\r\nBut you already know all this, that\'s why you want to learn HTML and CSS too. Well, you came to the right place!\r\n\r\nThis is the best and most complete course for starting your web development journey that you will find on Udemy. It\'s an all-in-one package that takes you from knowing nothing about HTML and CSS, to building beautiful websites using tools and technologies that professional web developers use every single day.\r\n\r\n\r\n\r\n[02] Why is this course so unique and popular?\r\n\r\nReason #1: The course is completely project-based\r\n\r\nSimple demos are boring, and therefore you\'re gonna learn everything by building actual projects! In the final project (www.omnifood.dev), together we hand-code a beautiful and responsive landing page for a fictional company that I made up just for the course.\r\n\r\n\r\n\r\nReason #2: You will not just learn how to code\r\n\r\nCoding is great, but it\'s not everything! That\'s why we will go through the entire 7-step process of building and launching our website project.\r\n\r\nSo the huge Omnifood project will teach you real-world skills to build real-world HTML and CSS websites: how to plan projects and page layouts, how to implement designs using HTML and CSS techniques, how to write clean and organized code, how to optimize websites for good speed performance, and many more.\r\n\r\nOn top of that, this course has a huge focus on beautiful design. In fact, this is the only course on the market that focuses on both coding and designing, together.\r\n\r\n\r\n\r\nReason #3: I\'m the right teacher for you\r\n\r\nWith the right guidance and a well-structured curriculum, building websites can be quite easy and fun to learn. With a bunch of random tutorials and YouTube videos? Not so much. And that\'s where I come in.\r\n\r\nMy name is Jonas, I\'m an experienced web developer and designer, and one of Udemy\'s top instructors. I have been teaching this bestselling course since 2015 to over 200,000 developers, always listening to feedback and understanding exactly how students actually learn.\r\n\r\nUsing that feedback, I recently rebuilt this course from scratch and designed the ideal course curriculum for every type of student. It\'s a unique blend of projects, deep explanations, theory lectures, and challenges. I\'m sure you\'re gonna love it!\r\n\r\n\r\n\r\n[03] Why is this course so long?\r\n\r\nReason #1: I take time to explain every single concept that I teach, so that you actually learn, and not just copy code from the screen (this is a course, not a tutorial)\r\n\r\nReason #2: I go into topics that other HTML and CSS courses shy away from: professional web design, component and layout patterns, some CSS theory, website planning in theory and practice, and developer skills. I believe you need all of this to be successful!\r\n\r\nReason #3: There is a lot of repetition, so that you actually assimilate and practice what you learn. Practice is the single most important ingredient to learning, and therefore I provide plenty of opportunities for you to sharpen your skills\r\n\r\n\r\n\r\n[04] Here is what\'s also included in the package:\r\n\r\nUp-to-date HD-quality videos, that are easy to search and reference (great for Udemy Business students)\r\n\r\nProfessional English captions (not the auto-generated ones)\r\n\r\nDownloadable design assets + starter code and final code for each section\r\n\r\nDownloadable slides for 20+ theory videos (not boring, I promise!)\r\n\r\nAccess to countless free design and development resources that I curated over many years\r\n\r\nFree support in the course Q&A\r\n\r\n10+ coding challenges to practice your new skills (solutions included)\r\n\r\n\r\n\r\n[05] This course is for you if...\r\n\r\n... you are a complete beginner with no idea of how to build a website.\r\n\r\n... you already know a bit of HTML and CSS from some tutorials or videos, but struggle to put together a good-looking, complete website.\r\n\r\n... you are a designer and want to expand your skills into HTML and CSS, because all your designer friends are learning how to code (they are smart!).\r\n\r\nBasically, if you are an HTML and CSS master, and build the most beautiful websites in the world, then DON\'T take the course. Everyone else: you should take the course, today.\r\n\r\n\r\n\r\nSo, does all of this sound great? Then join me and 200,000+ other developers and start your web development journey today!\r\n\r\nWho this course is for:\r\nComplete beginners who want to learn how to build a professional, beautiful and responsive website\r\nStudents with some knowledge about HTML and CSS, but who struggle to put together a great website\r\nDesigners who want to expand their skill set into HTML5 and CSS3', 1, 7, 0, 3, 1, 2, 1, NULL, 'fff91d226cb855fc8a33bbc825a6c91e', 0, 0, 'a welcome message for a set', 'a congratulations message', 'HTML and CSS', '', 'uploads/courses/1660465027maxresdefault (3).jpg', '', NULL, '0', '0', '2022-07-18 12:47:50'),
(9, 'Master Your Mindset & Brain Framestorm Your Way to Success', 'Business Course', 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic.\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages.', 1, 2, 0, 2, 1, 1, 1, NULL, '5fb4e222ca52b1187a6cfcfd7c07f0a8', 0, 0, NULL, NULL, 'Business', '', 'uploads/courses/1660464900business-development-concept-chart-keywords-icons-white-background-business-development-concept-chart-keywords-104026478.jpg', '', NULL, '0', '0', '2022-07-18 13:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `currency` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `symbol` varchar(4) CHARACTER SET utf8mb4 NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency`, `symbol`, `disabled`) VALUES
(1, 'US Doller', '$', 0),
(2, 'Canadian Doller', '$', 0),
(3, 'Bangladeshi Taka', '৳', 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `symbol` varchar(30) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(11) NOT NULL,
  `level` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level`, `disabled`) VALUES
(1, 'Beginners Level', 0),
(2, 'Intermediate Level', 0),
(3, 'Expert Level', 0),
(4, 'All Levels', 0);

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `name`, `price`, `disabled`) VALUES
(1, 'Free', '7000', 0),
(2, 'Free', '5000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(2048) CHARACTER SET utf8mb4 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `about` varchar(2048) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `country` varchar(1000) DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `image` varchar(1024) NOT NULL,
  `facebook_link` varchar(1024) DEFAULT NULL,
  `instagram_link` varchar(1024) DEFAULT NULL,
  `twitter_link` varchar(1024) DEFAULT NULL,
  `linkedin_link` varchar(1024) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `role`, `about`, `company`, `designation`, `country`, `address`, `phone`, `slug`, `image`, `facebook_link`, `instagram_link`, `twitter_link`, `linkedin_link`, `date`) VALUES
(1, 'Mahbubur', 'Rahman', 'mahbubkhan88@gmail.com', '$2y$10$NDpStIytLo4dqJazGElgEOTyCquakmBcIE5sepTfhxx276Nct4mQW', 'Admin', 'Sunt est soluta temporibus accusantium neque nam maiores cumque temporibus. Tempora libero non est unde veniam est qui dolor.', 'Taseen Group', 'Graphics Designer', 'Bangladesh', '422/2, West Shewrapara, Mirpur, Dhaka-1216', '0987432454', 'mahbubur-rahman', 'uploads/images/1658033041105783-2.jpg', 'https://www.facebook.com/mumtahinacatering', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.linkedin.com', '2022-06-26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`(255)),
  ADD KEY `category` (`category`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `level_id` (`level_id`),
  ADD KEY `sub_category_id` (`sub_category_id`),
  ADD KEY `price_id` (`price_id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `primary_subject` (`primary_subject`),
  ADD KEY `date` (`date`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `published` (`published`(255)),
  ADD KEY `views` (`views`),
  ADD KEY `approved` (`approved`(255)),
  ADD KEY `trending` (`trending`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price` (`price`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disabled` (`disabled`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `firstname` (`firstname`),
  ADD KEY `lastname` (`lastname`),
  ADD KEY `email` (`email`),
  ADD KEY `date` (`date`),
  ADD KEY `slug` (`slug`),
  ADD KEY `slug_2` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
