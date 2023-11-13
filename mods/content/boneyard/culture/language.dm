//DEFINES START
#define LANGUAGE_ENGLISH	"American English"
#define LANGUAGE_FRENCH		"Canadian French"
#define LANGUAGE_SPANISH	"Mexican Spanish"
#define LANGUAGE_RUSSIAN	"Russian"
#define LANGUAGE_CHINESE	"Simplified Chinese"
/*#define LANGUAGE_UNITY		"Mutant"*/
//DEFINES END

// LANGUAGES START
// formerly /decl/language/human/euro, but /decl/language/human/common is hardcoded everywhere atm / Taken from Heart of Hestia but changed names - descriptions to fit setting more.
/decl/language/human/common
	name = LANGUAGE_ENGLISH
	desc = "English is the dominant language of both pre-war America and post-war ruins. You would be hard pressed to find anyone not familiar with it."
	speech_verb = "says"
	whisper_verb = "whispers"
	colour = COLOR_NAVY_BLUE
	key = "3"
	shorthand = "EN"
	partial_understanding = list(LANGUAGE_FRENCH = 20)
	syllables = list(
		"al", "an", "ar", "as", "at", "ea", "ed", "en", "er", "es", "ha", "he", "hi", "in", "is", "it",
		"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
		"ve", "wa", "all", "and", "are", "but", "ent", "era", "ere", "eve", "for", "had", "hat", "hen", "her", "hin",
		"ch", "de", "ge", "be", "ach", "abe", "ich", "ein", "die", "sch", "auf", "aus", "ber", "che", "ent", "que",
		"ait", "les", "lle", "men", "ais", "ans", "ait", "ave", "con", "com", "des", "tre", "eta", "eur", "est",
		"ing", "the", "ver", "was", "ith", "hin"
	)

/decl/language/human/french
	name = LANGUAGE_FRENCH
	desc = "A dialect of French that survived annexation and integration of Canada proper into USA. While nearly wiped out there are still small communities keeping it alive."
	colour = COLOR_BLUE
	key = "fr"
	shorthand = "FR"
	space_chance = 20
	partial_understanding = list(LANGUAGE_ENGLISH = 20)
	syllables = list(
		"al", "an", "ar", "as", "at", "ea", "ed", "en", "et", "es", "ha", "he", "hi", "in", "is", "it",
		"le", "me", "nd", "ne", "ng", "nt", "on", "or", "ou", "re", "se", "st", "te", "th", "ti", "to",
		"ve", "wa", "all", "and", "cou", "but", "ent", "era", "fou", "eve", "for", "had", "zou", "hen", "her", "hin",
		"ch", "de", "ge", "be", "vous", "abe", "ich", "ein", "die", "gnou", "pou", "tout", "ber", "che", "ent", "que",
		"ait", "les", "lle", "men", "ais", "ans", "mou", "ave", "con", "com", "des", "tre", "eta", "eur", "est",
		"ing", "the", "ver", "was", "ith", "nous"
	)

/decl/language/human/russian
	name = LANGUAGE_RUSSIAN
	desc = "Ancient eastern Slavic language that relies on cyrillic in it's written form. Exclusively found in Vaults where descendants of Soviet diplomats passed it on."
	colour = COLOR_RED_LIGHT
	key = "4"
	shorthand = "RS"
	partial_understanding = list()
	syllables = list(
		"rus", "zem", "ave", "groz", "ski", "ska", "ven", "konst", "pol", "lin", "svy",
		"danya", "da", "mied", "zan", "das", "krem", "myka", "to", "st", "no", "na", "ni",
		"ko", "ne", "en", "po", "ra", "li", "on", "byl", "cto", "eni", "ost", "ol", "ego",
		"ver", "stv", "pro"
	)

/decl/language/human/spanish
	name = LANGUAGE_SPANISH
	desc = "Second most spoken language in post-war America right behind English. Due to large cohesion of communities it remains unchanged from pre-war."
	colour = COLOR_WARM_YELLOW
	key = "5"
	shorthand = "MS"
	partial_understanding = list()
	syllables = list(
		"ad", "al", "an", "ar", "as", "ci", "co", "de", "do", "el", "en", "er", "es",
		"ie", "ue", "la", "ra", "os", "nt", "te", "ar", "qu", "el", "ta", "do", "co",
		"re", "as", "on", "aci", "ada", "ado", "ant", "ara", "cio", "com", "con", "des",
		"dos", "ent", "era", "ero", "que", "ent", "nte", "est", "ado", "par", "los", "ien",
		"sta", "una", "ion", "tra", "men", "ele", "nao", "uma", "ame", "dos", "uno", "mas",
		"ndo", "nha", "ver", "voc", "uma"
	)

/decl/language/human/chinese
	name = LANGUAGE_CHINESE
	desc = "A modern variant of Chinese used by the People's Liberation Army and their agents. Outside of surviving Ghoul population and Shi it's almost non-existent in post-war America."
	colour = COLOR_GREEN
	key = "as"
	shorthand = "SC"
	space_chance = 30
	partial_understanding = list()
	syllables = list(
		"a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao",
		"bie", "bin", "bing", "bo", "bu", "ca", "cai", "can", "cang", "cao", "ce", "cei", "cen", "ceng", "cha", "chai",
		"chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chua", "chuai", "chuan", "chuang", "chui", "chun",
		"chuo", "ci", "cong", "cou", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "dei",
		"den", "deng", "di", "dian", "diao", "die", "ding", "diu", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e",
		"ei", "en", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu", "ga", "gai", "gan", "gang",
		"gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha",
		"hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hm", "hng", "hong", "hou", "hu", "hua", "huai", "huan",
		"huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan",
		"jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "kei", "ken", "keng", "kong", "kou", "ku", "kua", "kuai",
		"kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lia", "lian",
		"liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "luan", "lun", "luo", "ma", "mai", "man", "mang",
		"mao", "me", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "miu", "mo", "mou", "mu", "na",
		"nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ng", "ni", "nian", "niang", "niao", "nie", "nin", "ning",
		"niu", "nong", "nou", "nu", "nuan", "nuo", "o", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng",
		"pi", "pian", "piao", "pie", "pin", "ping", "po", "pou", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin",
		"qing", "qiong", "qiu", "qu", "quan", "que", "qun", "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou",
		"ru", "rua", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sei", "sen", "seng", "sha",
		"shai", "shan", "shang", "shao", "she", "shei", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shuang", "shui",
		"shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "te",
		"teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo", "wa", "wai", "wan",
		"wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu",
		"xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yong", "you", "yu", "yuan",
		"yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zha", "zhai", "zhan", "zhang", "zhao",
		"zhe", "zhei", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi",
		"zong", "zou", "zuan", "zui", "zun", "zuo", "zu"
	)
