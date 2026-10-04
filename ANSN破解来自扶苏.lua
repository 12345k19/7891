-- 垃圾ansn开源by扶苏
local env = getfenv()

local obj = setmetatable({}, {
	__index = function(arg, arg2)
		return env[arg2]
	end,
	__newindex = function(arg, arg2, arg3)
		rawset(arg, arg2, arg3)
	end,
	__metatable = "ProtectedSandbox",
})

setfenv(1, obj)
local chunk = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))
setfenv(chunk, obj)
local v = chunk()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local playerFunc = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("PlayerFunc")

BuyItem = function(arg, arg2, arg3, arg4)
	local stuff = ReplicatedStorage:FindFirstChild("Stuff")
	if not stuff then
		warn("Error")
		return false, "未找到 Stuff"
	end

	for _, part in ipairs(string.split(arg, "/")) do
		stuff = stuff:FindFirstChild(part)
		if not stuff then
			warn("购买失败: " .. part)
			return false, "路径缺失: " .. part
		end
	end

	local v2 = stuff:FindFirstChild(arg2)
	if not v2 then
		warn("物品不存在: " .. arg2)
		return false, "物品不存在"
	end
	local response = playerFunc:InvokeServer("purchase", { isRestaurant = arg4, item = v2, quantity = arg3, color = nil })
	return response == true, tostring(response)
end

local tbl = {
	Enabled = false,
	TeamCheck = true,
	MaxDistance = 200,
	FontSize = 11,
	FadeOut = { OnDistance = true, OnDeath = false, OnLeave = false },
	Options = {
		Teamcheck = false,
		TeamcheckRGB = Color3.fromRGB(0, 255, 0),
		Friendcheck = true,
		FriendcheckRGB = Color3.fromRGB(0, 255, 0),
		Highlight = false,
		HighlightRGB = Color3.fromRGB(255, 0, 0),
	},
	Drawing = {
		Chams = {
			Enabled = true,
			Thermal = true,
			FillRGB = Color3.fromRGB(119, 120, 255),
			Fill_Transparency = 100,
			OutlineRGB = Color3.fromRGB(119, 120, 255),
			Outline_Transparency = 100,
			VisibleCheck = true,
		},
		Names = { Enabled = true, RGB = Color3.fromRGB(255, 255, 255) },
		Flags = { Enabled = true },
		Distances = { Enabled = true, Position = "Text", RGB = Color3.fromRGB(255, 255, 255) },
		Weapons = {
			Enabled = true,
			WeaponTextRGB = Color3.fromRGB(119, 120, 255),
			Outlined = false,
			Gradient = false,
			GradientRGB1 = Color3.fromRGB(255, 255, 255),
			GradientRGB2 = Color3.fromRGB(119, 120, 255),
		},
		Healthbar = {
			Enabled = true,
			HealthText = true,
			Lerp = false,
			HealthTextRGB = Color3.fromRGB(119, 120, 255),
			Width = 2.5,
			Gradient = true,
			GradientRGB1 = Color3.fromRGB(200, 0, 0),
			GradientRGB2 = Color3.fromRGB(60, 60, 125),
			GradientRGB3 = Color3.fromRGB(119, 120, 255),
		},
		Boxes = {
			Animate = true,
			RotationSpeed = 300,
			Gradient = false,
			GradientRGB1 = Color3.fromRGB(119, 120, 255),
			GradientRGB2 = Color3.fromRGB(0, 0, 0),
			GradientFill = true,
			GradientFillRGB1 = Color3.fromRGB(119, 120, 255),
			GradientFillRGB2 = Color3.fromRGB(0, 0, 0),
			Filled = { Enabled = true, Transparency = 0.75, RGB = Color3.fromRGB(0, 0, 0) },
			Full = { Enabled = true, RGB = Color3.fromRGB(255, 255, 255) },
			Corner = { Enabled = true, RGB = Color3.fromRGB(255, 255, 255) },
			Skeleton = {
				Enabled = true,
				RGB = Color3.fromRGB(170, 0, 255),
				OutlineRGB = Color3.fromRGB(0, 0, 0),
				Outlined = true,
				Thickness = 2,
				OutlineThickness = 1,
				Transparency = 0.1,
				VisibleCheck = true,
				BehindTransparency = 0.45,
				FadeOnDistance = false,
			},
		},
	},
	Connections = { RunService = RunService },
	Fonts = {},
}

v:Localization({
	Enabled = true,
	Prefix = "loc:",
	DefaultLanguage = "zh-cn",
	Translations = {
		["zh-cn"] = {
			WINDUI_EXAMPLE = "扶苏破解",
			WELCOME = "欢迎使用 ANSN HUB",
			LIB_DESC = "一体化辅助",
			SETTINGS = "设置",
			APPEARANCE = "外观",
			FEATURES = "功能",
			UTILITIES = "工具",
			UI_ELEMENTS = "UI 元素",
			CONFIGURATION = "配置",
			SAVE_CONFIG = "保存配置",
			LOAD_CONFIG = "加载配置",
			THEME_SELECT = "选择主题",
			TRANSPARENCY = "窗口透明度",
		},
	},
})

v.TransparencyValue = 0.2
v:SetTheme("Indigo")
local HttpService = game:GetService("HttpService")
local str = "9cbb4adb-2884-4c86-b8f4-eb688d6f5010"
local str2 = "km_47jdpqn40ks3qwotw503wtakcr3g669x"

local function fn(arg, arg2, arg3)
	local request_ = nil

	if http_request and type(http_request) == "function" then
		request_ = http_request
	elseif request and type(request) == "function" then
		request_ = request
	elseif syn and syn.request and type(syn.request) == "function" then
		request_ = syn.request
	elseif http and http.request and type(http.request) == "function" then
		request_ = http.request
	end

	if not request_ then
		return nil, "未找到可用的 HTTP 请求函数"
	end

	local ok, result = pcall(function()
		return request_({ Url = arg, Method = "POST", Headers = arg2, Body = arg3 })
	end)

	if not ok then
		return nil, result
	end
	return result, nil
end

local function fn2()
	local txt = nil

	pcall(function()
		txt = readfile("ansn_device.txt")
	end)

	if txt and #txt > 6 then
		return txt
	end
	local localPlayer = game.Players.LocalPlayer
	local str3 = ""

	for i = 1, 8 do
		str3 ..= string.char(math.random(48, 57))
	end

	local str4 = localPlayer.Name .. "-" .. localPlayer.UserId .. "-" .. str3

	pcall(function()
		writefile("ansn_device.txt", str4)
	end)

	return str4
end

local v2 = fn2()

local function fn3(arg)
	local json = HttpService:JSONEncode({
		api_key = str2,
		app_id = str,
		card_code = arg:gsub("%s", ""),
		device_id = v2,
		device_name = "Roblox客户端",
	})

	local activate, v3 = fn("https://km.fly-fly.fun/api/v1/activate", { ["Content-Type"] = "application/json" }, json)
	if not activate then
		return false, "网络请求失败: " .. (v3 or "未知错误")
	end
	local statusCode = activate.StatusCode or activate.status_code or 0
	local body = activate.Body or activate.body or ""
	if statusCode ~= 200 then
		return false, "服务器返回异常 (HTTP " .. statusCode .. ")"
	end
	local pos = body:find("\"success\":true") or body:find("success:true")
	local match = body:match("\"remaining_days\":\"?(%d+)\"?") or body:match("remaining_days:(%d+)")
	if pos and match then
		return true, "激活成功，剩余" .. match .. "天"
	end
	return false, "激活失败，请检查卡密或网络"
end

local function fn4(arg)
	local json = HttpService:JSONEncode({ api_key = str2, app_id = str, card_code = arg:gsub("%s", ""), device_id = v2 })
	local verify, v3 = fn("https://km.fly-fly.fun/api/v1/verify", { ["Content-Type"] = "application/json" }, json)
	if not verify then
		return false, "校验网络失败: " .. (v3 or "未知错误")
	end
	local statusCode = verify.StatusCode or verify.status_code or 0
	local body = verify.Body or verify.body or ""
	if statusCode ~= 200 then
		return false, "校验服务器异常 (HTTP " .. statusCode .. ")"
	end
	local pos = body:find("\"success\":true") or body:find("success:true")
	local pos2 = body:find("\"valid\":true") or body:find("valid:true")
	local match = body:match("\"remaining_days\":\"?(%d+)\"?") or body:match("remaining_days:(%d+)")
	if (pos or pos2) and match then
		return true, "卡密有效，剩余" .. match .. "天"
	end
	return false, "卡密已失效"
end

local function fn5(arg)
	local v3, v4 = fn3(arg)
	if not v3 then
		v:Notify({ Title = "卡密验证失败", Content = v4, Duration = 3 })
		return false
	end
	local v5, v6 = fn4(arg)
	if not v5 then
		v:Notify({ Title = "卡密校验失败", Content = v6, Duration = 3 })
		return false
	end
	return true
end

if game:GetService("UserInputService").TouchEnabled then
end

local Players = game:GetService("Players")
game:GetService("RunService")
local localPlayer = Players.LocalPlayer

local tbl2 = {
	HoldTime = 0,
	Distance = 25,
	HitboxEnabled = false,
	HitboxSize = 10,
	WhitelistEnabled = false,
	TeleportEnabled = false,
	NoclipEnabled = false,
	AimEnabled = false,
	AimSmoothness = 5,
	AimMaxDistance = 200,
	AimCheckWall = true,
	BulletTrackEnabled = false,
	ScreenMode = true,
	DistanceMode = false,
	KillAuraEnabled = false,
	KillAuraRange = 50,
	SkeletonEnabled = false,
	TaxiEnabled = false,
	TaxiWaitTime = 7,
	NoDizziness = false,
	NoDizzinessSpeed = 24,
	AutoBusEnabled = false,
	AutoJobEnabled = false,
	RPMEnabled = false,
	RPMTarget = 1800,
	InfiniteAmmoEnabled = false,
	AutoATMHack = false,
	AutoAllHack = false,
	AutoArrestWantedEnabled = false,
	AutoArrestWantedInterval = 1.5,
	AntiPolicePushEnabled = false,
	TrafficLightWantedEnabled = false,
}

local v3 = cloneref(game:GetService("Workspace"))
local v4 = cloneref(game:GetService("RunService"))
local v5 = cloneref(game:GetService("Players"))
local CoreGui = game:GetService("CoreGui")
cloneref(game:GetService("Lighting"))
local localPlayer2 = v5.LocalPlayer
local currentCamera = v3.CurrentCamera
local rotation = -45
local now = tick()

local tbl3 = {
	Create = function(arg, arg2, arg3)
		arg2 = typeof(arg2) == "string" and Instance.new(arg2) or arg2

		for k, v6 in pairs(arg3) do
			arg2[k] = v6
		end

		return arg2
	end,
	FadeOutOnDist = function(arg, arg2, arg3)
		local n = math.max(0.1, 1 - arg3 / tbl.MaxDistance)

		if arg2:IsA("TextLabel") then
			arg2.TextTransparency = 1 - n
		elseif arg2:IsA("ImageLabel") then
			arg2.ImageTransparency = 1 - n
		elseif arg2:IsA("UIStroke") then
			arg2.Transparency = 1 - n
		elseif arg2:IsA("Frame") and (arg2 == Healthbar or arg2 == BehindHealthbar) then
			arg2.BackgroundTransparency = 1 - n
		elseif arg2:IsA("Frame") then
			arg2.BackgroundTransparency = 1 - n
		elseif arg2:IsA("Highlight") then
			arg2.FillTransparency = 1 - n
			arg2.OutlineTransparency = 1 - n
		end
	end,
}

local flag = nil

coroutine.wrap(function()
	local ok, result = pcall(function()
		return game:GetService("LocalizationService"):GetTranslatorForPlayerAsync(localPlayer2)
	end)

	flag = ok and result and result or false
end)()

local tbl4 = {}

local tbl5 = {
	Police = "警察",
	police = "警察",
	Pol = "警察",
	Cop = "警察",
	cop = "警察",
	Cops = "警察",
	Officer = "警官",
	["Senior Officer"] = "高级警官",
	Chief = "警长",
	Sheriff = "警长",
	Deputy = "副警长",
	Sargent = "警长",
	SWAT = "特警",
	swat = "特警",
	["S.W.A.T"] = "特警",
	FBI = "联邦探员",
	CIA = "中央情报局",
	NSA = "国安局",
	Inspector = "督察",
	Constable = "警察",
	Marshal = "执法官",
	Detective = "侦探",
	detective = "侦探",
	Investigator = "调查员",
	Security = "保安",
	security = "保安",
	Guard = "守卫",
	guard = "守卫",
	Bodyguard = "保镖",
	Bouncer = "保镖",
	Watchman = "守夜人",
	["Traffic Cop"] = "交警",
	Criminal = "罪犯",
	criminal = "罪犯",
	Crim = "罪犯",
	Robber = "强盗",
	robber = "强盗",
	Thief = "盗贼",
	thief = "盗贼",
	Burglar = "入室窃贼",
	Pickpocket = "扒手",
	["Con Artist"] = "骗子",
	Prisoner = "囚犯",
	prisoner = "囚犯",
	Inmate = "囚犯",
	Convict = "罪犯",
	Felon = "重罪犯",
	Offender = "罪犯",
	Murderer = "凶手",
	murderer = "凶手",
	Killer = "杀手",
	killer = "杀手",
	Assassin = "刺客",
	assassin = "刺客",
	Hitman = "职业杀手",
	Terrorist = "恐怖分子",
	terrorist = "恐怖分子",
	["Counter-Terrorist"] = "反恐精英",
	CounterTerrorist = "反恐精英",
	CT = "反恐精英",
	ct = "反恐精英",
	Traitor = "叛徒",
	traitor = "叛徒",
	Spy = "间谍",
	spy = "间谍",
	Gangster = "帮派成员",
	Thug = "暴徒",
	thug = "暴徒",
	Bandit = "土匪",
	bandit = "土匪",
	Outlaw = "亡命徒",
	outlaw = "亡命徒",
	Pirate = "海盗",
	pirate = "海盗",
	Smuggler = "走私者",
	smuggler = "走私者",
	DrugDealer = "毒贩",
	["Drug Dealer"] = "毒贩",
	Dealer = "毒贩",
	Mafia = "黑手党",
	Cartel = "贩毒集团",
	Doctor = "医生",
	doctor = "医生",
	Doc = "医生",
	Medic = "医疗",
	medic = "医疗",
	Med = "医疗",
	Medical = "医疗",
	medical = "医疗",
	["Medical Staff"] = "医疗",
	MedicalStaff = "医疗",
	["医疗"] = "医疗",
	["医务人员"] = "医疗",
	Nurse = "护士",
	nurse = "护士",
	Surgeon = "外科医生",
	Healer = "治疗师",
	healer = "治疗师",
	Heal = "治疗",
	Paramedic = "急救员",
	EMT = "急救员",
	EMS = "急救员",
	ems = "急救员",
	["E.M.S"] = "急救员",
	Pharmacist = "药剂师",
	Vet = "兽医",
	veterinarian = "兽医",
	["First Aid"] = "急救员",
	FirstResponder = "急救员",
	Civilian = "平民",
	civilian = "平民",
	Civ = "平民",
	civ = "平民",
	Civillian = "平民",
	Civlian = "平民",
	Citizen = "市民",
	citizen = "市民",
	Townsperson = "镇民",
	Villager = "村民",
	villager = "村民",
	Peasant = "农民",
	Passenger = "乘客",
	passenger = "乘客",
	Tourist = "游客",
	Refugee = "难民",
	refugee = "难民",
	Survivor = "幸存者",
	survivor = "幸存者",
	Bystander = "旁观者",
	Victim = "受害者",
	Spectator = "旁观者",
	spectator = "旁观者",
	Spec = "旁观",
	Referee = "裁判",
	Hostage = "人质",
	Soldier = "士兵",
	soldier = "士兵",
	Army = "军人",
	Military = "军人",
	military = "军人",
	Trooper = "骑兵",
	Marine = "海军陆战队员",
	marines = "海军陆战队员",
	Navy = "海军",
	["Air Force"] = "空军",
	Airforce = "空军",
	Commander = "指挥官",
	commander = "指挥官",
	General = "将军",
	general = "将军",
	Colonel = "上校",
	Captain = "队长",
	captain = "队长",
	Lieutenant = "中尉",
	Sergeant = "中士",
	Corporal = "下士",
	Major = "少校",
	Recruit = "新兵",
	recruit = "新兵",
	Private = "列兵",
	Cadet = "军校学员",
	cadet = "军校学员",
	Veteran = "老兵",
	Mercenary = "雇佣兵",
	mercenary = "雇佣兵",
	Insurgent = "叛乱分子",
	Rebel = "反抗者",
	rebel = "反抗者",
	Fighter = "战士",
	fighter = "战士",
	Warrior = "战士",
	warrior = "战士",
	Knight = "骑士",
	knight = "骑士",
	Sniper = "狙击手",
	sniper = "狙击手",
	Gunner = "炮手",
	gunner = "炮手",
	Tank = "坦克手",
	Scout = "侦察兵",
	scout = "侦察兵",
	Demolitions = "爆破手",
	Demolition = "爆破手",
	Engineer = "工程师",
	engineer = "工程师",
	Eng = "工程师",
	Marksman = "神枪手",
	marksman = "神枪手",
	Berserker = "狂战士",
	Gladiator = "角斗士",
	Paladin = "圣骑士",
	paladin = "圣骑士",
	Brawler = "拳手",
	["Bounty Hunter"] = "赏金猎人",
	BountyHunter = "赏金猎人",
	Slayer = "杀手",
	slayer = "杀手",
	Hunter = "猎人",
	Builder = "建造者",
	builder = "建造者",
	Architect = "建筑师",
	Mason = "泥瓦匠",
	Carpenter = "木匠",
	carpenter = "木匠",
	Electrician = "电工",
	Plumber = "水管工",
	Painter = "油漆工",
	Farmer = "农民",
	farmer = "农民",
	Rancher = "牧场主",
	Fisherman = "渔夫",
	fisherman = "渔夫",
	Miner = "矿工",
	miner = "矿工",
	Lumberjack = "伐木工",
	Chef = "厨师",
	chef = "厨师",
	Cook = "厨师",
	Baker = "面包师",
	Butcher = "屠夫",
	Blacksmith = "铁匠",
	blacksmith = "铁匠",
	Merchant = "商人",
	merchant = "商人",
	Shopkeeper = "店主",
	Cashier = "收银员",
	Banker = "银行家",
	Salesman = "销售员",
	Trader = "商人",
	trader = "商人",
	Waiter = "服务员",
	Bartender = "酒保",
	Receptionist = "接待员",
	Janitor = "清洁工",
	Clerk = "职员",
	Manager = "经理",
	Boss = "老板",
	boss = "老板",
	Owner = "老板",
	owner = "老板",
	Employee = "员工",
	Worker = "工人",
	worker = "工人",
	Laborer = "劳工",
	Courier = "快递员",
	Mailman = "邮递员",
	Delivery = "配送",
	delivery = "配送",
	["Delivery Man"] = "快递员",
	Mage = "法师",
	mage = "法师",
	Magi = "法师",
	Wizard = "巫师",
	wizard = "巫师",
	Sorcerer = "巫师",
	Warlock = "术士",
	warlock = "术士",
	Necromancer = "死灵法师",
	Shaman = "萨满",
	shaman = "萨满",
	Druid = "德鲁伊",
	druid = "德鲁伊",
	Priest = "牧师",
	priest = "牧师",
	Monk = "武僧",
	monk = "武僧",
	Bard = "吟游诗人",
	Cleric = "牧师",
	cleric = "牧师",
	Alchemist = "炼金术士",
	Enchanter = "附魔师",
	Summoner = "召唤师",
	Illusionist = "幻术师",
	Conjurer = "咒术师",
	Elementalist = "元素师",
	Ninja = "忍者",
	ninja = "忍者",
	Shinobi = "忍者",
	Samurai = "武士",
	samurai = "武士",
	Vampire = "吸血鬼",
	vampire = "吸血鬼",
	Werewolf = "狼人",
	Demon = "恶魔",
	demon = "恶魔",
	Angel = "天使",
	angel = "天使",
	Ghost = "幽灵",
	ghost = "幽灵",
	Phantom = "幻影",
	Zombie = "丧尸",
	zombie = "丧尸",
	Skeleton = "骷髅",
	skeleton = "骷髅",
	Dragon = "龙",
	dragon = "龙",
	Exorcist = "驱魔人",
	["Dark Knight"] = "黑骑士",
	DarkKnight = "黑骑士",
	Student = "学生",
	student = "学生",
	Pupil = "小学生",
	Teacher = "老师",
	teacher = "老师",
	Professor = "教授",
	professor = "教授",
	Principal = "校长",
	Tutor = "辅导员",
	Librarian = "图书管理员",
	Researcher = "研究员",
	Scientist = "科学家",
	scientist = "科学家",
	["Lab Assistant"] = "实验助手",
	Astronaut = "宇航员",
	Pilot = "飞行员",
	pilot = "飞行员",
	Driver = "司机",
	driver = "司机",
	Sailor = "水手",
	sailor = "水手",
	Mechanic = "机械师",
	mechanic = "机械师",
	Taxi = "出租车司机",
	Trucker = "卡车司机",
	["Bus Driver"] = "公交车司机",
	["Train Driver"] = "火车司机",
	["Airline Pilot"] = "民航飞行员",
	Boxer = "拳击手",
	boxer = "拳击手",
	Athlete = "运动员",
	Coach = "教练",
	Magician = "魔术师",
	magician = "魔术师",
	Comedian = "喜剧演员",
	Musician = "音乐家",
	Singer = "歌手",
	Dancer = "舞者",
	Actor = "演员",
	Director = "导演",
	Streamer = "主播",
	Gambler = "赌徒",
	Croupier = "荷官",
	Mayor = "市长",
	mayor = "市长",
	Governor = "州长",
	President = "总统",
	president = "总统",
	Dictator = "独裁者",
	King = "国王",
	king = "国王",
	Queen = "女王",
	queen = "女王",
	Prince = "王子",
	prince = "王子",
	Princess = "公主",
	princess = "公主",
	Judge = "法官",
	judge = "法官",
	Lawyer = "律师",
	lawyer = "律师",
	Senator = "参议员",
	Jury = "陪审团",
	Hero = "英雄",
	hero = "英雄",
	Villain = "反派",
	villain = "反派",
	Monster = "怪物",
	monster = "怪物",
	Alien = "外星人",
	alien = "外星人",
	Robot = "机器人",
	robot = "机器人",
	Cyborg = "半机器人",
	Admin = "管理员",
	admin = "管理员",
	Staff = "工作人员",
	staff = "工作人员",
	Moderator = "版主",
	moderator = "版主",
	Helper = "助手",
	helper = "助手",
	VIP = "VIP",
	vip = "VIP",
	Donator = "赞助者",
	Supporter = "支持者",
	Developer = "开发者",
	developer = "开发者",
	Premium = "高级会员",
	Member = "会员",
	member = "会员",
	Guest = "访客",
	guest = "访客",
	Noob = "菜鸟",
	noob = "菜鸟",
	Pro = "高手",
	pro = "高手",
	Imposter = "内鬼",
	imposter = "内鬼",
	Impostor = "内鬼",
	Crewmate = "船员",
	Handcuffs = "手铐",
	handcuffs = "手铐",
	Handcuff = "手铐",
	HandCuffs = "手铐",
	["Hand-Cuffs"] = "手铐",
	Cuffs = "手铐",
	cuffs = "手铐",
	Cuff = "手铐",
	cuff = "手铐",
	["Zip Tie"] = "扎带",
	ZipTies = "扎带",
	Rope = "绳子",
	Taser = "电击枪",
	["Stun Gun"] = "电击枪",
	StunGun = "电击枪",
	Baton = "警棍",
	Nightstick = "警棍",
	["Stun Baton"] = "电击棍",
	["Pepper Spray"] = "辣椒喷雾",
	PepperSpray = "辣椒喷雾",
	Pistol = "手枪",
	pistol = "手枪",
	Handgun = "手枪",
	Glock = "格洛克手枪",
	glock = "格洛克手枪",
	["Glock-17"] = "格洛克17",
	["Desert Eagle"] = "沙漠之鹰",
	Deagle = "沙漠之鹰",
	deagle = "沙漠之鹰",
	DesertEagle = "沙漠之鹰",
	Revolver = "左轮手枪",
	["R8 Revolver"] = "R8左轮",
	Magnum = "马格南",
	Colt = "柯尔特",
	["Colt 1911"] = "柯尔特1911",
	M1911 = "M1911手枪",
	USP = "USP手枪",
	P226 = "P226手枪",
	["Five-Seven"] = "FN57手枪",
	FiveSeven = "FN57手枪",
	Rifle = "步枪",
	rifle = "步枪",
	["Assault Rifle"] = "突击步枪",
	AK47 = "AK47",
	["AK-47"] = "AK-47",
	AKM = "AKM步枪",
	["AK-74"] = "AK-74",
	AK74 = "AK74",
	M4A1 = "M4A1",
	M4 = "M4步枪",
	M4A4 = "M4A4",
	M16 = "M16步枪",
	M16A4 = "M16A4",
	SCAR = "SCAR步枪",
	["SCAR-L"] = "SCAR-L",
	["SCAR-H"] = "SCAR-H",
	HK416 = "HK416",
	G36 = "G36步枪",
	G36C = "G36C",
	FAMAS = "FAMAS步枪",
	AUG = "AUG步枪",
	Tavor = "塔沃尔",
	Sniper = "狙击枪",
	["Sniper Rifle"] = "狙击步枪",
	AWP = "AWP狙击枪",
	AWS = "AWS狙击枪",
	AWM = "AWM狙击枪",
	Barrett = "巴雷特",
	M82 = "M82",
	L96 = "L96狙击枪",
	Shotgun = "霰弹枪",
	shotgun = "霰弹枪",
	["Remington 870"] = "雷明顿870",
	Mossberg = "莫斯伯格",
	["SPAS-12"] = "SPAS12",
	["AA-12"] = "AA12",
	["Double Barrel"] = "双管霰弹枪",
	["DB Shotgun"] = "双管霰弹枪",
	SMG = "冲锋枪",
	smg = "冲锋枪",
	["Submachine Gun"] = "冲锋枪",
	MP5 = "MP5",
	MP7 = "MP7",
	UMP = "UMP",
	UZI = "乌兹",
	Uzi = "乌兹",
	["Micro UZI"] = "微型乌兹",
	["MAC-10"] = "MAC10",
	["MAC 10"] = "MAC10",
	P90 = "P90",
	Vector = "维克托",
	["Kriss Vector"] = "Kriss维克托",
	Thompson = "汤普森",
	["Tommy Gun"] = "汤普森",
	["Machine Gun"] = "机枪",
	LMG = "轻机枪",
	M249 = "M249",
	M60 = "M60",
	RPK = "RPK",
	PKM = "PKM",
	MG42 = "MG42",
	RPG = "RPG火箭筒",
	["RPG-7"] = "RPG7",
	["Grenade Launcher"] = "榴弹发射器",
	M203 = "M203榴弹发射器",
	M79 = "M79榴弹发射器",
	AT4 = "AT4火箭筒",
	Stinger = "毒刺导弹",
	Javelin = "标枪导弹",
	["Flare Gun"] = "信号枪",
	Knife = "匕首",
	knife = "匕首",
	["Combat Knife"] = "战斗匕首",
	Bayonet = "刺刀",
	Sword = "剑",
	sword = "剑",
	Katana = "武士刀",
	Machete = "砍刀",
	Axe = "斧头",
	axe = "斧头",
	["Fire Axe"] = "消防斧",
	Hatchet = "短柄斧",
	Tomahawk = "战斧",
	Hammer = "锤子",
	Sledgehammer = "大锤",
	Mallet = "木槌",
	Bat = "棒球棍",
	["Baseball Bat"] = "棒球棍",
	["Cricket Bat"] = "板球棍",
	Club = "棍棒",
	Crowbar = "撬棍",
	Pipe = "钢管",
	Wrench = "扳手",
	Shovel = "铲子",
	Pickaxe = "镐子",
	Chainsaw = "电锯",
	Fists = "拳头",
	["Brass Knuckles"] = "指虎",
	Medkit = "医疗包",
	MedKit = "医疗包",
	medkit = "医疗包",
	["Medical Kit"] = "医疗箱",
	["First Aid Kit"] = "急救包",
	["First Aid"] = "急救包",
	Bandage = "绷带",
	Bandages = "绷带",
	Gauze = "纱布",
	Painkillers = "止痛药",
	Pills = "药片",
	Tablet = "药片",
	Syringe = "注射器",
	Morphine = "吗啡",
	Adrenaline = "肾上腺素",
	Epinephrine = "肾上腺素",
	Antibiotics = "抗生素",
	Antidote = "解毒剂",
	Vitamin = "维生素",
	Medicine = "药品",
	Stethoscope = "听诊器",
	Defibrillator = "除颤器",
	AED = "自动体外除颤器",
	Lockpick = "开锁器",
	["Lock Pick"] = "开锁器",
	["Lockpick Set"] = "开锁器套装",
	Flashlight = "手电筒",
	Torch = "手电筒",
	Lantern = "灯笼",
	Lighter = "打火机",
	Matches = "火柴",
	Candle = "蜡烛",
	Key = "钥匙",
	keys = "钥匙",
	Radio = "对讲机",
	["Walkie Talkie"] = "对讲机",
	["Two-Way Radio"] = "对讲机",
	Phone = "手机",
	["Cell Phone"] = "手机",
	Smartphone = "智能手机",
	Laptop = "笔记本电脑",
	Computer = "电脑",
	Tablet = "平板电脑",
	Camera = "相机",
	GoPro = "运动相机",
	Binoculars = "望远镜",
	["Night Vision"] = "夜视仪",
	NVG = "夜视仪",
	["Thermal Goggles"] = "热成像仪",
	GPS = "GPS",
	Compass = "指南针",
	Map = "地图",
	Watch = "手表",
	Smartwatch = "智能手表",
	["Flash Drive"] = "U盘",
	USB = "U盘",
	["Hard Drive"] = "硬盘",
	C4 = "C4炸药",
	["C4 Charge"] = "C4炸药",
	TNT = "TNT炸药",
	Dynamite = "炸药",
	Explosive = "炸药",
	Grenade = "手榴弹",
	["Frag Grenade"] = "破片手榴弹",
	["HE Grenade"] = "高爆手榴弹",
	["Smoke Grenade"] = "烟雾弹",
	["Smoke Bomb"] = "烟雾弹",
	Flashbang = "闪光弹",
	["Flash Bang"] = "闪光弹",
	["Stun Grenade"] = "眩晕弹",
	Smoke = "烟雾",
	Molotov = "燃烧瓶",
	["Molotov Cocktail"] = "燃烧瓶",
	["Pipe Bomb"] = "管状炸弹",
	Bomb = "炸弹",
	Ammo = "弹药",
	Ammunition = "弹药",
	Bullets = "子弹",
	Shells = "霰弹",
	Rounds = "子弹",
	Magazine = "弹匣",
	Mag = "弹匣",
	Armor = "护甲",
	Vest = "防弹衣",
	["Body Armor"] = "防弹衣",
	Helmet = "头盔",
	["Gas Mask"] = "防毒面具",
	Mask = "面具",
	Gold = "金条",
	["Gold Bar"] = "金条",
	Silver = "银条",
	Diamond = "钻石",
	Gem = "宝石",
	Ruby = "红宝石",
	Cash = "现金",
	Money = "钱",
	Dollar = "美元",
	Coin = "硬币",
	Bread = "面包",
	Apple = "苹果",
	Burger = "汉堡",
	Pizza = "披萨",
	Water = "水",
	["Bottled Water"] = "瓶装水",
	Soda = "汽水",
	Cola = "可乐",
	Coke = "可乐",
	Pepsi = "百事可乐",
	Coffee = "咖啡",
	Tea = "茶",
	Milk = "牛奶",
	["Energy Drink"] = "能量饮料",
	["Red Bull"] = "红牛",
	Beer = "啤酒",
	Wine = "葡萄酒",
	Whiskey = "威士忌",
	Vodka = "伏特加",
	Taxis = "出租车司机",
	TAXI = "出租车司机",
	["Taxi Driver"] = "出租车司机",
	TaxiDriver = "出租车司机",
	["taxi driver"] = "出租车司机",
	taxi_driver = "出租车司机",
	["taxi-driver"] = "出租车司机",
	["TAXI DRIVER"] = "出租车司机",
	["Cab Driver"] = "出租车司机",
	CabDriver = "出租车司机",
	["cab driver"] = "出租车司机",
	cab_driver = "出租车司机",
	cabbie = "出租车司机",
	Cabbie = "出租车司机",
	Cabby = "出租车司机",
	Taxicab = "出租车司机",
	TaxiCab = "出租车司机",
	Cab = "出租车司机",
	cab = "出租车司机",
	CAB = "出租车司机",
	TaxiMan = "出租车司机",
	Taximan = "出租车司机",
	["taxi man"] = "出租车司机",
	["Taxi Man"] = "出租车司机",
	Taxi_Guy = "出租车司机",
	TaxiGuy = "出租车司机",
	["Taxi Guy"] = "出租车司机",
	["taxi guy"] = "出租车司机",
	Taxi_Driver = "出租车司机",
	Cab_Man = "出租车司机",
	CabMan = "出租车司机",
	["出租车"] = "出租车司机",
	["出租车司机"] = "出租车司机",
	["计程车"] = "出租车司机",
	["计程车司机"] = "出租车司机",
	["的士"] = "出租车司机",
	["的士司机"] = "出租车司机",
	["Delivery Man"] = "配送员",
	DeliveryMan = "配送员",
	["delivery man"] = "配送员",
	["Delivery Guy"] = "配送员",
	DeliveryGuy = "配送员",
	["delivery guy"] = "配送员",
	["Delivery Boy"] = "配送员",
	DeliveryBoy = "配送员",
	["delivery boy"] = "配送员",
	["Delivery Driver"] = "配送员",
	DeliveryDriver = "配送员",
	["Delivery boy"] = "配送员",
	courier = "配送员",
	["Courier Driver"] = "配送员",
	CourierDriver = "配送员",
	Deliverer = "配送员",
	Deliver = "配送员",
	["Food Delivery"] = "外卖配送员",
	FoodDelivery = "外卖配送员",
	["外卖员"] = "外卖配送员",
	["外卖"] = "外卖配送",
	["外卖骑手"] = "外卖配送员",
	["快递员"] = "配送员",
	["快递"] = "配送员",
	["Road Cleaner"] = "道路清洁工",
	RoadCleaner = "道路清洁工",
	["road cleaner"] = "道路清洁工",
	Roadcleaner = "道路清洁工",
	road_cleaner = "道路清洁工",
	["road-cleaner"] = "道路清洁工",
	["ROAD CLEANER"] = "道路清洁工",
	ROADCLEANER = "道路清洁工",
	["R.C."] = "道路清洁工",
	RC = "道路清洁工",
	["Street Cleaner"] = "道路清洁工",
	StreetCleaner = "道路清洁工",
	["street cleaner"] = "道路清洁工",
	Streetcleaner = "道路清洁工",
	street_cleaner = "道路清洁工",
	["street-cleaner"] = "道路清洁工",
	["STREET CLEANER"] = "道路清洁工",
	STREETCLEANER = "道路清洁工",
	["Sanitation Worker"] = "道路清洁工",
	SanitationWorker = "道路清洁工",
	["sanitation worker"] = "道路清洁工",
	Sanitationworker = "道路清洁工",
	sanitation_worker = "道路清洁工",
	["sanitation-worker"] = "道路清洁工",
	Sanitation = "道路清洁工",
	sanitation = "道路清洁工",
	["Garbage Collector"] = "道路清洁工",
	GarbageCollector = "道路清洁工",
	["garbage collector"] = "道路清洁工",
	Garbagecollector = "道路清洁工",
	garbage_collector = "道路清洁工",
	["garbage-collector"] = "道路清洁工",
	["Garbage Man"] = "道路清洁工",
	GarbageMan = "道路清洁工",
	["garbage man"] = "道路清洁工",
	garbage_man = "道路清洁工",
	Garbageman = "道路清洁工",
	garbageman = "道路清洁工",
	["Trash Collector"] = "道路清洁工",
	TrashCollector = "道路清洁工",
	["trash collector"] = "道路清洁工",
	Trashcollector = "道路清洁工",
	trash_collector = "道路清洁工",
	["trash-collector"] = "道路清洁工",
	["Trash Man"] = "道路清洁工",
	TrashMan = "道路清洁工",
	Trashman = "道路清洁工",
	["trash man"] = "道路清洁工",
	trash_man = "道路清洁工",
	trashman = "道路清洁工",
	["Street Sweeper"] = "道路清洁工",
	StreetSweeper = "道路清洁工",
	["street sweeper"] = "道路清洁工",
	Streetsweeper = "道路清洁工",
	street_sweeper = "道路清洁工",
	["street-sweeper"] = "道路清洁工",
	["Road Sweeper"] = "道路清洁工",
	RoadSweeper = "道路清洁工",
	["road sweeper"] = "道路清洁工",
	Roadsweeper = "道路清洁工",
	road_sweeper = "道路清洁工",
	["road-sweeper"] = "道路清洁工",
	Sweeper = "道路清洁工",
	sweeper = "道路清洁工",
	Dustman = "道路清洁工",
	dustman = "道路清洁工",
	["Dust Man"] = "道路清洁工",
	DustMan = "道路清洁工",
	["Bin Man"] = "道路清洁工",
	BinMan = "道路清洁工",
	Binman = "道路清洁工",
	["bin man"] = "道路清洁工",
	bin_man = "道路清洁工",
	binman = "道路清洁工",
	["Bin Collector"] = "道路清洁工",
	BinCollector = "道路清洁工",
	Cleaner = "清洁工",
	cleaner = "清洁工",
	Cleaning = "清洁工",
	Janitors = "清洁工",
	["清洁工"] = "清洁工",
	["扫地工"] = "道路清洁工",
	["环卫工"] = "道路清洁工",
	["环卫工人"] = "道路清洁工",
	["环卫"] = "道路清洁工",
	["道路清洁"] = "道路清洁工",
	["道路清扫"] = "道路清洁工",
	["路扫工"] = "道路清洁工",
	["清洁员"] = "道路清洁工",
	["清洁工人"] = "道路清洁工",
	["Police Officer"] = "警察",
	PoliceOfficer = "警察",
	["police officer"] = "警察",
	["Traffic Police"] = "交警",
	TrafficPolice = "交警",
	["traffic police"] = "交警",
	["巡警"] = "警察",
	["民警"] = "警察",
	["警官"] = "警官",
	["警员"] = "警员",
	["公安"] = "警察",
	Fireman = "消防员",
	fireman = "消防员",
	["Fire Fighter"] = "消防员",
	FireFighter = "消防员",
	["fire fighter"] = "消防员",
	["医师"] = "医生",
	["大夫"] = "医生",
	["医务员"] = "医生",
	cook = "厨师",
	["厨子"] = "厨师",
	["农户"] = "农民",
	["庄稼人"] = "农民",
	["老百姓"] = "平民",
	["民众"] = "平民",
	["市民"] = "平民",
	["群众"] = "平民",
	Transport = "转运",
	transport = "转运",
	Transit = "转运",
	transit = "转运",
	Transfer = "转运",
	transfer = "转运",
	Transporter = "转运",
	["转运"] = "转运",
	["运输员"] = "转运",
	["运输"] = "转运",
	Receiver = "收货",
	receiver = "收货",
	Receiving = "收货",
	receiving = "收货",
	["Goods Receiver"] = "收货",
	GoodsReceiver = "收货",
	["Receiver Worker"] = "收货",
	ReceiverWorker = "收货",
	["收货"] = "收货",
	["收货员"] = "收货",
	["收货工人"] = "收货",
	["Tow Truck Assistant"] = "拖车助理",
	TowTruckAssistant = "拖车助理",
	["Tow Assistant"] = "拖车助理",
	TowAssistant = "拖车助理",
	["Towing Assistant"] = "拖车助理",
	TowingAssistant = "拖车助理",
	["Tow Truck Helper"] = "拖车助理",
	TowTruckHelper = "拖车助理",
	["Tow Helper"] = "拖车助理",
	TowHelper = "拖车助理",
	["拖车"] = "拖车助理",
	["拖车助理"] = "拖车助理",
	["拖车员"] = "拖车助理",
}

local function fn6(arg)
	if not arg or arg == "" then
		return nil
	end

	if tbl5[arg] then
		return tbl5[arg]
	end
	local str3 = arg:lower()

	for k, v6 in pairs(tbl5) do
		if k:lower() == str3 then
			return v6
		end
	end

	local str4 = arg:gsub("[_%-%./]", " ")

	if str4 ~= arg then
		if tbl5[str4] then
			return tbl5[str4]
		end
		local str5 = str4:lower()

		for k, v6 in pairs(tbl5) do
			if k:lower() == str5 then
				return v6
			end
		end
	end

	local n = 0
	local v6 = nil

	for k, v7 in pairs(tbl5) do
		local str5 = k:lower()

		if #str5 >= 3 and str3:find(str5, 1, true) and #str5 > n then
			n = #str5
			v6 = v7
		end
	end

	return v6
end

tbl3.GetTranslator = function()
	return flag
end

tbl3.RobloxTranslate = function(arg, arg2)
	if not arg2 or type(arg2) ~= "string" or arg2 == "" then
		return arg2
	end

	if tbl4[arg2] ~= nil then
		return tbl4[arg2]
	end
	local translator = arg:GetTranslator()

	if translator then
		local ok, result = pcall(function()
			return translator:Translate(game, arg2)
		end)

		if ok and result and type(result) == "string" and result ~= "" and result ~= arg2 then
			tbl4[arg2] = result
			return result
		end
	end

	local v6 = fn6(arg2)

	if v6 then
		if translator ~= nil then
			tbl4[arg2] = v6
		end

		return v6
	end

	if translator ~= nil then
		tbl4[arg2] = arg2
	end

	return arg2
end

local tbl6 = {}

tbl3.JobTranslate = function(arg, arg2)
	if not arg2 or type(arg2) ~= "string" or arg2 == "" then
		return arg2
	end

	if tbl6[arg2] ~= nil then
		return tbl6[arg2]
	end
	tbl6[arg2] = fn6(arg2) or arg2
	return tbl6[arg2]
end

getPlayerTeamName = function(arg)
	if not arg then
		return "无"
	end

	if arg.Team then
		return tbl3:JobTranslate(arg.Team.Name)
	end
	return "无"
end

getPlayerJob = function(arg)
	if not arg then
		return "未知"
	end

	local function fn7(arg2)
		if not arg2 then
			return nil
		end
		local tbl7 = { "Job", "职业", "Class", "Role", "职位", "Profession", "Occupation", "PlayerJob", "job" }

		for _, v6 in ipairs(tbl7) do
			local v7 = arg2:FindFirstChild(v6)
			if v7 and v7:IsA("StringValue") and v7.Value ~= "" then
				return v7.Value
			end
		end

		for _, v6 in ipairs(tbl7) do
			local ok, result = pcall(function()
				return arg2:GetAttribute(v6)
			end)

			if ok and result and type(result) == "string" and result ~= "" then
				return result
			end
		end

		return nil
	end

	if arg.Character then
		local v6 = fn7(arg.Character)
		if v6 then
			return tbl3:JobTranslate(v6)
		end
	end

	local v6 = fn7(arg)
	if v6 then
		return tbl3:JobTranslate(v6)
	end

	for _, v7 in ipairs({ "PlayerData", "Data", "Stats", "Profile", "数据" }) do
		local character = arg:FindFirstChild(v7) or arg.Character and arg.Character:FindFirstChild(v7)

		if character then
			local v8 = fn7(character)
			if v8 then
				return tbl3:JobTranslate(v8)
			end
		end
	end

	local leaderstats = arg:FindFirstChild("leaderstats")

	if leaderstats then
		local v7 = fn7(leaderstats)
		if v7 then
			return tbl3:JobTranslate(v7)
		end
	end

	return "未知"
end

isGunItem = function(arg)
	if not arg then
		return false
	end
	local str3 = arg:lower()
	if str3:find("pistol") or str3:find("glock") or str3:find("m9") or str3:find("beretta") or str3:find("deagle") or str3:find("desert") or str3:find("revolver") or str3:find("magnum") or str3:find("colt") or str3:find("luger") or str3:find("m1911") or str3:find("tt%-33") or str3:find("makorov") or str3:find("pm") or str3:find("cz%-75") or str3:find("p226") or str3:find("p250") or str3:find("usp") or str3:find("fn") or str3:find("five%-seven") or str3:find("handgun") then
		return true
	end

	if str3:find("rifle") or str3:find("ak") or str3:find("m4") or str3:find("m16") or str3:find("scar") or str3:find("hk416") or str3:find("g36") or str3:find("famas") or str3:find("aug") or str3:find("tavor") or str3:find("qbz") or str3:find("type 95") or str3:find("type 97") or str3:find("assault") then
		return true
	end

	if str3:find("sniper") or str3:find("awp") or str3:find("aws") or str3:find("l96") or str3:find("awm") or str3:find("barrett") or str3:find("m82") or str3:find("m200") or str3:find("cheytac") or str3:find("remington 700") or str3:find("hunting") or str3:find("mosin") then
		return true
	end

	if str3:find("shotgun") or str3:find("remington 870") or str3:find("mossberg") or str3:find("benelli") or str3:find("spas") or str3:find("aa%-12") or str3:find("double barrel") or str3:find("db") then
		return true
	end

	if str3:find("smg") or str3:find("submachine") or str3:find("mp5") or str3:find("mp7") or str3:find("ump") or str3:find("uzi") or str3:find("mac%-10") or str3:find("mac 10") or str3:find("p90") or str3:find("vector") or str3:find("kriss") or str3:find("thompson") or str3:find("tommy") or str3:find("pp%-19") or str3:find("bizon") then
		return true
	end

	if str3:find("machine gun") or str3:find("lmg") or str3:find("m249") or str3:find("m60") or str3:find("rpk") or str3:find("pkm") or str3:find("mg42") or str3:find("minigun") or str3:find("gatling") then
		return true
	end

	if str3:find("rpg") or str3:find("launcher") or str3:find("at4") or str3:find("stinger") or str3:find("javelin") or str3:find("grenade launcher") or str3:find("m79") or str3:find("m203") or str3:find("gl") or str3:find("flare gun") then
		return true
	end

	if str3:find("枪") or str3:find("手枪") or str3:find("步枪") or str3:find("狙击") or str3:find("霰弹") or str3:find("冲锋") or str3:find("机枪") or str3:find("发射器") or str3:find("火箭筒") then
		return true
	end
	return false
end

isHoldingHandcuffs = function(arg)
	if not arg or not arg.Character then
		return false
	end
	local character = arg.Character
	local tool = character:FindFirstChildOfClass("Tool")

	if tool then
		local str3 = tool.Name:lower()
		if str3:find("handcuff") or str3:find("手铐") or str3:find("铐") then
			return true
		end
	end

	local hopperBin = character:FindFirstChildOfClass("HopperBin")

	if hopperBin then
		local str3 = hopperBin.Name:lower()
		if str3:find("handcuff") or str3:find("手铐") or str3:find("铐") then
			return true
		end
	end

	for _, child in pairs(character:GetChildren()) do
		if child:IsA("Model") and child:FindFirstChild("Handle") then
			local str3 = child.Name:lower()
			if str3:find("handcuff") or str3:find("手铐") or str3:find("铐") then
				return true
			end
		end
	end

	return false
end

getHeldItemName = function(arg)
	if not arg or not arg.Character then
		return "无"
	end
	local character = arg.Character

	local function fn7()
		local tool = character:FindFirstChildOfClass("Tool")
		if tool then
			return tool.Name
		end
		local hopperBin = character:FindFirstChildOfClass("HopperBin")
		if hopperBin then
			return hopperBin.Name
		end

		for _, child in pairs(character:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("Handle") then
				return child.Name
			end
		end

		return nil
	end

	local v6 = fn7()
	if not v6 then
		return "无"
	end

	if v6:lower() == "weapononback" then
		return "空手"
	end
	return tbl3:RobloxTranslate(v6)
end

translateItemName = function(arg)
	if not arg or arg == "" then
		return "未知"
	end
	return tbl3:RobloxTranslate(arg)
end

local espHolder

if CoreGui:FindFirstChild("ESPHolder") then
	espHolder = CoreGui:FindFirstChild("ESPHolder")
else
	espHolder = tbl3:Create("ScreenGui", { Parent = CoreGui, Name = "ESPHolder" })
end

local function fn7(arg)
	if espHolder:FindFirstChild(arg.Name) then
		espHolder[arg.Name]:Destroy()
	end
end

local function fn8(arg)
	coroutine.wrap(fn7)(arg)

	local tween = tbl3:Create("TextLabel", {
		Parent = espHolder,
		Position = UDim2.new(0.5, 0, 0, -11),
		Size = UDim2.new(0, 100, 0, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = Enum.Font.Code,
		TextSize = tbl.FontSize,
		TextStrokeTransparency = 0,
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
		RichText = true,
	})

	local tween2 = tbl3:Create("TextLabel", {
		Parent = espHolder,
		Position = UDim2.new(0.5, 0, 0, 11),
		Size = UDim2.new(0, 100, 0, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = Enum.Font.Code,
		TextSize = tbl.FontSize,
		TextStrokeTransparency = 0,
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
		RichText = true,
	})

	local tween3 = tbl3:Create("TextLabel", {
		Parent = espHolder,
		Position = UDim2.new(0.5, 0, 0, 31),
		Size = UDim2.new(0, 100, 0, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = Enum.Font.Code,
		TextSize = tbl.FontSize,
		TextStrokeTransparency = 0,
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
		RichText = true,
	})

	local tween4 = tbl3:Create("Frame", {
		Parent = espHolder,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.75,
		BorderSizePixel = 0,
	})

	local new = ColorSequenceKeypoint.new
	local gradientFillRGB2 = tbl.Drawing.Boxes.GradientFillRGB2

	local tween5 = tbl3:Create("UIGradient", {
		Parent = tween4,
		Enabled = tbl.Drawing.Boxes.GradientFill,
		Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, tbl.Drawing.Boxes.GradientFillRGB1), new(1, gradientFillRGB2) }),
	})

	local tween6 = tbl3:Create("UIStroke", {
		Parent = tween4,
		Enabled = tbl.Drawing.Boxes.Gradient,
		Transparency = 0,
		Color = Color3.fromRGB(255, 255, 255),
		LineJoinMode = Enum.LineJoinMode.Miter,
	})

	local new2 = ColorSequenceKeypoint.new
	local gradientRGB2 = tbl.Drawing.Boxes.GradientRGB2

	local tween7 = tbl3:Create("UIGradient", {
		Parent = tween6,
		Enabled = tbl.Drawing.Boxes.Gradient,
		Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, tbl.Drawing.Boxes.GradientRGB1), new2(1, gradientRGB2) }),
	})

	local tween8 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0 })

	local tween9 = tbl3:Create("Frame", {
		Parent = espHolder,
		ZIndex = -1,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0,
	})

	local v6 = tbl3
	local create = v6.Create
	local tbl7 = { Parent = tween8, Enabled = tbl.Drawing.Healthbar.Gradient, Rotation = -90 }
	local colorSequence = ColorSequence.new
	local tbl8 = {}
	local v7 = ColorSequenceKeypoint.new(0, tbl.Drawing.Healthbar.GradientRGB1)
	local v8 = ColorSequenceKeypoint.new(0.5, tbl.Drawing.Healthbar.GradientRGB2)
	local new3 = ColorSequenceKeypoint.new
	local gradientRGB3 = tbl.Drawing.Healthbar.GradientRGB3
	tbl8[1] = v7
	tbl8[2] = v8

	do
		local values = table.pack(new3(1, gradientRGB3))
		table.move(values, 1, values.n, 3, tbl8)
	end

	tbl7.Color = colorSequence(tbl8)
	create(v6, "UIGradient", tbl7)

	local tween10 = tbl3:Create("TextLabel", {
		Parent = espHolder,
		Position = UDim2.new(0.5, 0, 0, 31),
		Size = UDim2.new(0, 100, 0, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = Enum.Font.Code,
		TextSize = tbl.FontSize,
		TextStrokeTransparency = 0,
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	})

	local tween11 = tbl3:Create("Highlight", {
		Parent = espHolder,
		FillTransparency = 1,
		OutlineTransparency = 0,
		OutlineColor = Color3.fromRGB(119, 120, 255),
		DepthMode = "AlwaysOnTop",
	})

	local tween12 = tbl3:Create("ImageLabel", {
		Parent = espHolder,
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(0, 40, 0, 40),
	})

	local new4 = ColorSequenceKeypoint.new
	local gradientRGB22 = tbl.Drawing.Weapons.GradientRGB2

	tbl3:Create("UIGradient", {
		Parent = tween12,
		Rotation = -90,
		Enabled = tbl.Drawing.Weapons.Gradient,
		Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, tbl.Drawing.Weapons.GradientRGB1), new4(1, gradientRGB22) }),
	})

	local color = Color3.fromRGB(255, 255, 255)

	pcall(function()
		local corner = tbl.Drawing.Boxes.Corner

		if corner and corner.RGB then
			color = corner.RGB
		end
	end)

	local tween13 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })
	local tween14 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })
	local tween15 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })
	local tween16 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })
	local tween17 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })
	local tween18 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })
	local tween19 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })
	local tween20 = tbl3:Create("Frame", { Parent = espHolder, BackgroundColor3 = color, Position = UDim2.new(0, 0, 0, 0) })

	local tween21 = tbl3:Create("TextLabel", {
		Parent = espHolder,
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(0, 100, 0, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = Enum.Font.Code,
		TextSize = tbl.FontSize,
		TextStrokeTransparency = 0,
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	})

	local tween22 = tbl3:Create("TextLabel", {
		Parent = espHolder,
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(0, 100, 0, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Font = Enum.Font.Code,
		TextSize = tbl.FontSize,
		TextStrokeTransparency = 0,
		TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
	})

	local tbl9 = {}
	local tbl10 = {}

	for i = 1, 14 do
		local tween23 = tbl3:Create("Frame", {
			Parent = espHolder,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = tbl.Drawing.Boxes.Skeleton.RGB,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 0, tbl.Drawing.Boxes.Skeleton.Thickness),
			Visible = false,
		})

		local tween24 = tbl3:Create("UIStroke", {
			Parent = tween23,
			Color = tbl.Drawing.Boxes.Skeleton.OutlineRGB,
			Thickness = tbl.Drawing.Boxes.Skeleton.OutlineThickness,
			Enabled = tbl.Drawing.Boxes.Skeleton.Outlined,
		})

		table.insert(tbl9, tween23)
		table.insert(tbl10, tween24)
	end

	local function fn9()
		local connection = nil

		local function fn10()
			tween4.Visible = false
			tween.Visible = false
			tween2.Visible = false
			tween3.Visible = false
			tween8.Visible = false
			tween9.Visible = false
			tween10.Visible = false
			tween12.Visible = false
			tween13.Visible = false
			tween14.Visible = false
			tween17.Visible = false
			tween18.Visible = false
			tween15.Visible = false
			tween16.Visible = false
			tween19.Visible = false
			tween20.Visible = false
			tween21.Visible = false
			tween11.Enabled = false
			tween22.Visible = false

			for i = 1, #tbl9 do
				tbl9[i].Visible = false
			end

			if not arg then
				espHolder:Destroy()
				connection:Disconnect()
			end
		end

		connection = v4.RenderStepped:Connect(function()
			if not tbl.Enabled then
				fn10()
				return
			end

			if arg.Character and arg.Character:FindFirstChild("HumanoidRootPart") then
				local humanoidRootPart = arg.Character.HumanoidRootPart
				local humanoid = arg.Character:WaitForChild("Humanoid")
				local v9, v10 = currentCamera:WorldToScreenPoint(humanoidRootPart.Position)
				local n = (currentCamera.CFrame.Position - humanoidRootPart.Position).Magnitude / 3.5714285714

				if v10 and n <= tbl.MaxDistance then
					local n2 = humanoidRootPart.Size.Y * currentCamera.ViewportSize.Y / v9.Z * 2
					local n3 = 3 * n2
					local n4 = 4.5 * n2

					if tbl.FadeOut.OnDistance then
						tbl3:FadeOutOnDist(tween4, n)
						tbl3:FadeOutOnDist(tween6, n)
						tbl3:FadeOutOnDist(tween, n)
						tbl3:FadeOutOnDist(tween2, n)
						tbl3:FadeOutOnDist(tween3, n)
						tbl3:FadeOutOnDist(tween8, n)
						tbl3:FadeOutOnDist(tween9, n)
						tbl3:FadeOutOnDist(tween10, n)
						tbl3:FadeOutOnDist(tween12, n)
						tbl3:FadeOutOnDist(tween13, n)
						tbl3:FadeOutOnDist(tween14, n)
						tbl3:FadeOutOnDist(tween17, n)
						tbl3:FadeOutOnDist(tween18, n)
						tbl3:FadeOutOnDist(tween15, n)
						tbl3:FadeOutOnDist(tween16, n)
						tbl3:FadeOutOnDist(tween19, n)
						tbl3:FadeOutOnDist(tween20, n)
						tbl3:FadeOutOnDist(tween11, n)
						tbl3:FadeOutOnDist(tween21, n)
						tbl3:FadeOutOnDist(tween22, n)
					end

					if tbl.TeamCheck and arg ~= localPlayer2 and (localPlayer2.Team ~= arg.Team and arg.Team or not localPlayer2.Team and not arg.Team) and arg.Character and arg.Character:FindFirstChild("HumanoidRootPart") and arg.Character:FindFirstChild("Humanoid") then
						tween11.Adornee = arg.Character
						tween11.Enabled = tbl.Drawing.Chams.Enabled
						tween11.FillColor = tbl.Drawing.Chams.FillRGB
						tween11.OutlineColor = tbl.Drawing.Chams.OutlineRGB

						if tbl.Drawing.Chams.Thermal then
							local n5 = math.atan(math.sin(tick() * 2)) * 2 / 3.1415926535897931
							tween11.FillTransparency = tbl.Drawing.Chams.Fill_Transparency * n5 * 0.01
							tween11.OutlineTransparency = tbl.Drawing.Chams.Outline_Transparency * n5 * 0.01
						end

						if tbl.Drawing.Chams.VisibleCheck then
							tween11.DepthMode = "Occluded"
						else
							tween11.DepthMode = "AlwaysOnTop"
						end

						tween13.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween13.Position = UDim2.new(0, v9.X - n3 / 2, 0, v9.Y - n4 / 2)
						tween13.Size = UDim2.new(0, n3 / 5, 0, 1)
						tween14.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween14.Position = UDim2.new(0, v9.X - n3 / 2, 0, v9.Y - n4 / 2)
						tween14.Size = UDim2.new(0, 1, 0, n4 / 5)
						tween17.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween17.Position = UDim2.new(0, v9.X - n3 / 2, 0, v9.Y + n4 / 2)
						tween17.Size = UDim2.new(0, 1, 0, n4 / 5)
						tween17.AnchorPoint = Vector2.new(0, 5)
						tween18.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween18.Position = UDim2.new(0, v9.X - n3 / 2, 0, v9.Y + n4 / 2)
						tween18.Size = UDim2.new(0, n3 / 5, 0, 1)
						tween18.AnchorPoint = Vector2.new(0, 1)
						tween15.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween15.Position = UDim2.new(0, v9.X + n3 / 2, 0, v9.Y - n4 / 2)
						tween15.Size = UDim2.new(0, n3 / 5, 0, 1)
						tween15.AnchorPoint = Vector2.new(1, 0)
						tween16.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween16.Position = UDim2.new(0, v9.X + n3 / 2 - 1, 0, v9.Y - n4 / 2)
						tween16.Size = UDim2.new(0, 1, 0, n4 / 5)
						tween16.AnchorPoint = Vector2.new(0, 0)
						tween19.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween19.Position = UDim2.new(0, v9.X + n3 / 2, 0, v9.Y + n4 / 2)
						tween19.Size = UDim2.new(0, 1, 0, n4 / 5)
						tween19.AnchorPoint = Vector2.new(1, 1)
						tween20.Visible = tbl.Drawing.Boxes.Corner.Enabled
						tween20.Position = UDim2.new(0, v9.X + n3 / 2, 0, v9.Y + n4 / 2)
						tween20.Size = UDim2.new(0, n3 / 5, 0, 1)
						tween20.AnchorPoint = Vector2.new(1, 1)
						tween4.Position = UDim2.new(0, v9.X - n3 / 2, 0, v9.Y - n4 / 2)
						tween4.Size = UDim2.new(0, n3, 0, n4)
						tween4.Visible = tbl.Drawing.Boxes.Full.Enabled

						if tbl.Drawing.Boxes.Filled.Enabled then
							tween4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

							if tbl.Drawing.Boxes.GradientFill then
								tween4.BackgroundTransparency = tbl.Drawing.Boxes.Filled.Transparency
							else
								tween4.BackgroundTransparency = 1
							end

							tween4.BorderSizePixel = 1
						else
							tween4.BackgroundTransparency = 1
						end

						local rotationSpeed = tbl.Drawing.Boxes.RotationSpeed
						rotation += (tick() - now) * rotationSpeed * math.cos(0.78539816339744828 * tick() - 1.5707963267948966)

						if tbl.Drawing.Boxes.Animate then
							tween5.Rotation = rotation
							tween7.Rotation = rotation
						else
							tween5.Rotation = -45
							tween7.Rotation = -45
						end

						now = tick()
						local n5 = humanoid.Health / humanoid.MaxHealth
						tween8.Visible = tbl.Drawing.Healthbar.Enabled
						tween8.Position = UDim2.new(0, v9.X - n3 / 2 - 6, 0, v9.Y - n4 / 2 + n4 * (1 - n5))
						tween8.Size = UDim2.new(0, tbl.Drawing.Healthbar.Width, 0, n4 * n5)
						tween9.Visible = tbl.Drawing.Healthbar.Enabled
						tween9.Position = UDim2.new(0, v9.X - n3 / 2 - 6, 0, v9.Y - n4 / 2)
						tween9.Size = UDim2.new(0, tbl.Drawing.Healthbar.Width, 0, n4)

						if tbl.Drawing.Healthbar.HealthText then
							local n6 = math.floor(humanoid.Health / humanoid.MaxHealth * 100)
							tween10.Position = UDim2.new(0, v9.X - n3 / 2 - 6, 0, v9.Y - n4 / 2 + n4 * (1 - n6 / 100) + 3)
							tween10.Text = tostring(n6)
							tween10.Visible = humanoid.Health < humanoid.MaxHealth

							if tbl.Drawing.Healthbar.Lerp then
								tween10.TextColor3 = n5 >= 0.75 and Color3.fromRGB(0, 255, 0) or n5 >= 0.5 and Color3.fromRGB(255, 255, 0) or n5 >= 0.25 and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(255, 0, 0)
							else
								tween10.TextColor3 = tbl.Drawing.Healthbar.HealthTextRGB
							end
						end

						if tbl.Drawing.Boxes.Skeleton.Enabled and arg.Character then
							local character = arg.Character
							local flag2 = character:FindFirstChild("UpperTorso") ~= nil or character:FindFirstChild("LeftUpperArm") ~= nil

							local tbl11 = {
								{ "Head", "UpperTorso" },
								{ "UpperTorso", "LowerTorso" },
								{ "UpperTorso", "LeftUpperArm" },
								{ "UpperTorso", "RightUpperArm" },
								{ "LeftUpperArm", "LeftLowerArm" },
								{ "RightUpperArm", "RightLowerArm" },
								{ "LeftLowerArm", "LeftHand" },
								{ "RightLowerArm", "RightHand" },
								{ "LowerTorso", "LeftUpperLeg" },
								{ "LowerTorso", "RightUpperLeg" },
								{ "LeftUpperLeg", "LeftLowerLeg" },
								{ "RightUpperLeg", "RightLowerLeg" },
								{ "LeftLowerLeg", "LeftFoot" },
								{ "RightLowerLeg", "RightFoot" },
							}

							tbl11 = flag2 and tbl11 or {
								{ "Head", "Torso" },
								{ "Torso", "Left Arm" },
								{ "Torso", "Right Arm" },
								{ "Torso", "Left Leg" },
								{ "Torso", "Right Leg" },
							}

							local backgroundTransparency = true

							if tbl.Drawing.Boxes.Skeleton.VisibleCheck then
								local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart2 then
									local position = currentCamera.CFrame.Position
									local position2 = humanoidRootPart2.Position
									local magnitude = (position2 - position).Magnitude

									if magnitude > 0.1 then
										if v3:FindPartOnRayWithIgnoreList(Ray.new(position, (position2 - position) / magnitude * (magnitude + 0.1)), { character, localPlayer2.Character }) then
											backgroundTransparency = false
										end
									end
								end
							end

							backgroundTransparency = backgroundTransparency and tbl.Drawing.Boxes.Skeleton.Transparency or tbl.Drawing.Boxes.Skeleton.BehindTransparency

							for i = 1, #tbl11 do
								local v11 = tbl11[i]
								local v12 = character:FindFirstChild(v11[1])
								local v13 = character:FindFirstChild(v11[2])
								local v14 = tbl9[i]
								local v15 = tbl10[i]

								if v12 and v13 and v14 and v15 then
									local v16, v17 = currentCamera:WorldToScreenPoint(v12.Position)
									local v18, v19 = currentCamera:WorldToScreenPoint(v13.Position)

									if v17 and v19 and v16.Z > 0 and v18.Z > 0 then
										local n6 = v18.X - v16.X
										local n7 = v18.Y - v16.Y
										local v20 = math.sqrt(n6 * n6 + n7 * n7)

										if v20 > 1 then
											local v21 = math.deg(math.atan2(n7, n6))
											v14.BackgroundColor3 = tbl.Drawing.Boxes.Skeleton.RGB
											v14.BackgroundTransparency = backgroundTransparency
											v15.Color = tbl.Drawing.Boxes.Skeleton.OutlineRGB
											v15.Thickness = tbl.Drawing.Boxes.Skeleton.OutlineThickness
											v15.Enabled = tbl.Drawing.Boxes.Skeleton.Outlined
											v14.Size = UDim2.new(0, v20, 0, tbl.Drawing.Boxes.Skeleton.Thickness)
											v14.Position = UDim2.new(0, (v16.X + v18.X) / 2, 0, (v16.Y + v18.Y) / 2)
											v14.Rotation = v21
											v14.Visible = true
										else
											v14.Visible = false
										end
									else
										v14.Visible = false
									end
								elseif v14 then
									v14.Visible = false
								end
							end

							for i = #tbl11 + 1, #tbl9 do
								tbl9[i].Visible = false
							end
						else
							for i = 1, #tbl9 do
								tbl9[i].Visible = false
							end
						end

						tween.Visible = tbl.Drawing.Names.Enabled
						local v11 = getPlayerJob(arg)
						local v12 = getPlayerTeamName(arg)
						local flag2 = isHoldingHandcuffs(arg)

						local function fn11(arg2)
							if arg2 == "Civilian" or arg2 == "civilian" or arg2 == "Civillian" or arg2 == "Civ" or arg2 == "civ" or arg2 == "Townsperson" then
								return "平民"
							end
							return arg2
						end

						local v13 = fn11(v11)
						local v14 = fn11(v12)
						flag2 = flag2 and (v13 == "平民" or v14 == "平民")
						local str3

						if v13 == "警察" or v13 == "特警" then
							str3 = "<font color=\"rgb(0, 150, 255)\">"
						elseif v13 == "罪犯" or v13 == "囚犯" then
							str3 = "<font color=\"rgb(255, 50, 50)\">"
						elseif v13 == "医生" or v13 == "急救员" or v13 == "医疗" then
							str3 = "<font color=\"rgb(50, 255, 50)\">"
						elseif v13 == "消防员" then
							str3 = "<font color=\"rgb(255, 150, 0)\">"
						elseif v13 == "平民" then
							str3 = "<font color=\"rgb(200, 200, 200)\">"
						elseif v13 == "农民" or v13 == "农夫" then
							str3 = "<font color=\"rgb(139, 195, 74)\">"
						elseif v13 == "厨师" then
							str3 = "<font color=\"rgb(255, 183, 197)\">"
						elseif v13 == "转运" then
							str3 = "<font color=\"rgb(170, 85, 255)\">"
						elseif v13 == "收货" then
							str3 = "<font color=\"rgb(0, 220, 200)\">"
						elseif v13 == "拖车助理" then
							str3 = "<font color=\"rgb(255, 200, 50)\">"
						else
							str3 = "<font color=\"rgb(255, 255, 100)\">"
						end

						local str4

						if v14 == "警察" or v14 == "特警" then
							str4 = "<font color=\"rgb(0, 150, 255)\">"
						elseif v14 == "罪犯" or v14 == "囚犯" then
							str4 = "<font color=\"rgb(255, 50, 50)\">"
						elseif v14 == "医生" or v14 == "急救员" or v14 == "医疗" then
							str4 = "<font color=\"rgb(50, 255, 50)\">"
						elseif v14 == "消防员" then
							str4 = "<font color=\"rgb(255, 150, 0)\">"
						elseif v14 == "平民" then
							str4 = "<font color=\"rgb(200, 200, 200)\">"
						elseif v14 == "农民" or v14 == "农夫" then
							str4 = "<font color=\"rgb(139, 195, 74)\">"
						elseif v14 == "厨师" then
							str4 = "<font color=\"rgb(255, 183, 197)\">"
						elseif v14 == "转运" then
							str4 = "<font color=\"rgb(170, 85, 255)\">"
						elseif v14 == "收货" then
							str4 = "<font color=\"rgb(0, 220, 200)\">"
						elseif v14 == "拖车助理" then
							str4 = "<font color=\"rgb(255, 200, 50)\">"
						elseif v14 == "配送" or v14 == "配送队" or v14 == "配送小队" then
							str4 = "<font color=\"rgb(255, 200, 0)\">"
						else
							str4 = "<font color=\"rgb(255, 255, 255)\">"
						end

						tween.Position = UDim2.new(0, v9.X, 0, v9.Y - n4 / 2 - 9)

						if flag2 then
							tween.TextColor3 = Color3.fromRGB(255, 100, 0)
							tween.TextStrokeColor3 = Color3.fromRGB(80, 0, 0)
							tween.Text = "⛓️ " .. arg.Name .. " 已被手铐铐住 [" .. math.floor(n) .. "米]"
						else
							tween.TextColor3 = tbl.Drawing.Names.RGB
							tween.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
							local text = arg.Name .. " [" .. math.floor(n) .. "米]"

							if v13 ~= "未知" and v14 ~= "无" and v13 == v14 then
								text ..= " | " .. str3 .. v13 .. "</font>"
							elseif v13 ~= "未知" and v14 ~= "无" and v14 ~= "中立" then
								text ..= " | " .. str3 .. v13 .. "</font> | " .. str4 .. v14 .. "</font>"
							elseif v13 ~= "未知" then
								text ..= " | " .. str3 .. v13 .. "</font>"
							elseif v14 ~= "无" and v14 ~= "中立" then
								text ..= " | " .. str4 .. v14 .. "</font>"
							end

							tween.Text = text
						end

						if tbl.Drawing.Distances.Enabled then
							if tbl.Drawing.Distances.Position == "Bottom" then
								tween3.Position = UDim2.new(0, v9.X, 0, v9.Y + n4 / 2 + 18)
								tween12.Position = UDim2.new(0, v9.X - 21, 0, v9.Y + n4 / 2 + 15)
								tween2.Position = UDim2.new(0, v9.X, 0, v9.Y + n4 / 2 + 7)
								tween2.Text = string.format("%d meters", math.floor(n))
								tween2.Visible = true
							elseif tbl.Drawing.Distances.Position == "Text" then
								tween3.Position = UDim2.new(0, v9.X, 0, v9.Y + n4 / 2 + 8)
								tween12.Position = UDim2.new(0, v9.X - 21, 0, v9.Y + n4 / 2 + 5)
								tween2.Visible = false

								if tbl.Options.Friendcheck and localPlayer2:IsFriendsWith(arg.UserId) then
									tween.Text = string.format("(<font color=\"rgb(%d, %d, %d)\">F</font>) %s [%d]", tbl.Options.FriendcheckRGB.R * 255, tbl.Options.FriendcheckRGB.G * 255, tbl.Options.FriendcheckRGB.B * 255, arg.Name, math.floor(n))
								else
									tween.Text = string.format("(<font color=\"rgb(%d, %d, %d)\">E</font>) %s [%d]", 255, 0, 0, arg.Name, math.floor(n))
								end

								tween.Visible = tbl.Drawing.Names.Enabled
							end
						end

						if tbl.Drawing.Weapons.Enabled then
							if isHoldingHandcuffs(arg) then
								tween3.Text = "⚠️ 手持：手铐"
								tween3.TextColor3 = Color3.fromRGB(255, 255, 0)
							else
								local v15 = getHeldItemName(arg)

								if v15 == "无" or v15 == "空手" then
									tween3.Text = "空手"
									tween3.TextColor3 = Color3.fromRGB(150, 150, 150)
								else
									if isGunItem(v15) then
										tween3.Text = "手持：" .. v15 .. "（枪）"
									else
										tween3.Text = "手持：" .. v15
									end

									tween3.TextColor3 = tbl.Drawing.Weapons.WeaponTextRGB
								end
							end

							tween3.Visible = true
						else
							tween3.Visible = false
						end
					else
						fn10()
					end
				else
					fn10()
				end
			else
				fn10()
			end
		end)
	end

	coroutine.wrap(fn9)()
end

local v6 = pairs
local Players2 = game:GetService("Players")

for _, player in v6(Players2:GetPlayers()) do
	if player.Name ~= localPlayer2.Name then
		coroutine.wrap(fn8)(player)
	end
end

game:GetService("Players").PlayerAdded:Connect(function(player)
	coroutine.wrap(fn8)(player)
end)

local tbl7 = {}
local tbl8 = {}
local n = 0
local flag2 = false
local tbl9 = {}
local tbl10 = {}

local function fn9()
	return {
		{ n = "车辆经销商", p = Vector3.new(3719.9502, 3.0185735, -333.31186), region = "圣奥里" },
		{ n = "医院", p = Vector3.new(3980.091, 2.8760607, -138.79454), region = "圣奥里" },
		{ n = "警察局", p = Vector3.new(3364.2732, 3.918808, -394.72336), region = "圣奥里" },
		{ n = "圣奥里修车店", p = Vector3.new(2782.4688, 2.6309958, -418.5993), region = "圣奥里" },
		{ n = "圣奥里银行", p = Vector3.new(3134.0542, 6.1160483, -171.36977), region = "圣奥里" },
		{ n = "圣奥里服装店", p = Vector3.new(3617.9126, 3.1072206, -452.82065), region = "圣奥里" },
		{ n = "圣奥里平民重生", p = Vector3.new(3741.115, 3.7205737, -438.106), region = "圣奥里" },
		{ n = "圣奥里码头", p = Vector3.new(4527.6562, -23.968239, -280.59357), region = "圣奥里" },
		{ n = "圣奥里餐饮店", p = Vector3.new(3182.4167, 3.018592, 426.5179), region = "圣奥里" },
		{ n = "消防部门", p = Vector3.new(3578.676, 8.408823, 579.6568), region = "圣奥里" },
		{ n = "宠物店", p = Vector3.new(3678.2373, 3.01792, 693.1146), region = "圣奥里" },
		{ n = "圣奥里大码头", p = Vector3.new(2736.3076, 2.630299, -1120.333), region = "圣奥里" },
		{ n = "圣奥里海滩桥下(消星点)", p = Vector3.new(3964.5044, -25.06821, -854.05725), region = "圣奥里" },
		{ n = "大景超级超市", p = Vector3.new(3936.5828, 3.038293, 1136.3264), region = "大景" },
		{ n = "转镜中心", p = Vector3.new(4152.92, 2.631675, 941.44604), region = "大景" },
		{ n = "道路服务", p = Vector3.new(4271.3325, 2.628108, 1200.0869), region = "大景" },
		{ n = "大景餐饮店", p = Vector3.new(4476.9976, 3.037825, 906.803), region = "大景" },
		{ n = "送货中心(美团外卖)", p = Vector3.new(4399.4194, 3.038999, 1609.4559), region = "大景" },
		{ n = "大景卖车店", p = Vector3.new(3434.3774, 42.931786, 2687.997), region = "大景" },
		{ n = "莱斯维尔餐饮店", p = Vector3.new(753.7578, 3.039824, 998.133), region = "莱斯维尔" },
		{ n = "莱斯维尔服装店", p = Vector3.new(820.7451, 2.766988, 1047.4457), region = "莱斯维尔" },
		{ n = "莱斯维尔自由广场", p = Vector3.new(926.5234, 2.630995, 865.7648), region = "莱斯维尔" },
		{ n = "莱斯维尔码头(游艇)", p = Vector3.new(947.8402, -22.529087, 1216.0857), region = "莱斯维尔" },
		{ n = "米尔顿左上加油站", p = Vector3.new(1145.6357, 2.630916, -864.2737), region = "米尔顿" },
		{ n = "米尔顿右下加油站", p = Vector3.new(-1646.8027, 2.630164, 1812.8947), region = "米尔顿" },
		{ n = "米尔顿上方加油站", p = Vector3.new(-900.70166, 2.630927, 1124.6831), region = "米尔顿" },
		{ n = "米尔顿居民区", p = Vector3.new(-528.56555, 2.630996, 1331.9817), region = "米尔顿" },
		{ n = "约克镇小银行", p = Vector3.new(-668.2172, 2.630995, -65.34784), region = "约克镇" },
		{ n = "约克镇修车厂", p = Vector3.new(-407.16302, 3.076807, -6.098211), region = "约克镇" },
		{ n = "约克镇枪店", p = Vector3.new(-323.8693, 3.037825, 37.14967), region = "约克镇" },
		{ n = "约克镇重生点", p = Vector3.new(-219.56032, 3.039824, -85.72543), region = "约克镇" },
		{ n = "约克镇当铺", p = Vector3.new(-168.51373, 3.039, -106.92653), region = "约克镇" },
		{ n = "约克镇卫星车", p = Vector3.new(-302.09357, 3.037825, -167.62102), region = "约克镇" },
		{ n = "约克镇中心点", p = Vector3.new(-275.9952, 2.630996, -139.98535), region = "约克镇" },
		{ n = "黑色市场", p = Vector3.new(1038.9698, -22.73295, 895.43024), region = "其他" },
		{ n = "鱼夫码头", p = Vector3.new(-50.147552, -24.555279, 1462.146), region = "其他" },
		{ n = "农场", p = Vector3.new(-1268.3392, 2.572412, 2560.0603), region = "其他" },
		{ n = "监狱门口", p = Vector3.new(-1697.9319, 2.630666, 1284.5674), region = "其他" },
		{ n = "监狱广场", p = Vector3.new(-1600.6024, 2.631028, 1268.06), region = "其他" },
		{ n = "代尔山", p = Vector3.new(847.063, 194.11575, -326.2127), region = "其他" },
		{ n = "水帘洞(消星点)", p = Vector3.new(3040.956, 109.68854, 2711.0693), region = "其他" },
		{ n = "大桥", p = Vector3.new(949.01495, 25.215754, 2897.6548), region = "其他" },
		{ n = "地图右下(消星点)", p = Vector3.new(-1651.385, 2.414712, 3225.2783), region = "其他" },
		{ n = "下部加油站", p = Vector3.new(2270.3782, 2.630927, 154.16148), region = "其他" },
		{ n = "游戏厅", p = Vector3.new(2934.8938, 2.956458, 1693.66), region = "其他" },
		{ n = "高尔夫", p = Vector3.new(2280.767, 3.037836, 1982.3573), region = "其他" },
		{ n = "修船厂", p = Vector3.new(4096.4053, -30.401447, 2865.0452), region = "其他" },
	}
end

local v7 = fn9()

local function fn10(arg)
	if not tbl2.TeleportEnabled or flag2 then
		return
	end
	local character = localPlayer.Character
	if not character then
		return
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return
	end

	pcall(function()
		humanoidRootPart.CFrame = CFrame.new(arg)
	end)
end

local function fn11()
	if flag2 or not tbl2.NoclipEnabled then
		return
	end
	local character = localPlayer.Character
	if not character then
		return
	end

	for _, descendant in ipairs(character:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.CanCollide = false
		end
	end
end

local function fn12(noclipEnabled)
	tbl2.NoclipEnabled = noclipEnabled

	if noclipEnabled then
		fn11()
	else
		local character = localPlayer.Character

		if character then
			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = true
				end
			end
		end
	end
end

local flag3 = false
local thread = nil

local function fn13()
	return true
end

local function fn14()
	local character = localPlayer.Character
	if not character then
		return nil
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return nil
	end
	local huge = math.huge
	local v8 = nil

	for _, player in ipairs(v5:GetPlayers()) do
		if player ~= localPlayer then
			local character2 = player.Character

			if character2 then
				local humanoid = character2:FindFirstChildOfClass("Humanoid")

				if not (not humanoid or humanoid.Health <= 0) then
					local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart2 then
						local attribute = player:GetAttribute("WantedLevel") or 0
						local attribute2 = player:GetAttribute("Team") or ""

						if attribute > 0 or attribute2 == "Criminal" then
							local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

							if magnitude < huge then
								huge = magnitude
								v8 = player
							end
						end
					end
				end
			end
		end
	end

	return v8
end

StartAutoArrestWanted = function()
	if flag3 then
		return
	end
	flag3 = true

	thread = task.spawn(function()
		while flag3 and tbl2.AutoArrestWantedEnabled do
			local flag4 = false

			if not fn13() then
				v:Notify({ Title = "自动抓捕", Content = "未装备手铐，暂停", Duration = 2 })
				task.wait(tbl2.AutoArrestWantedInterval)
				flag4 = true
			end

			if not flag4 then
				local v8 = fn14()

				if v8 then
					local character = v8.Character

					if character then
						local head = character:FindFirstChild("Head")
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

						if head and humanoidRootPart then
							local character2 = localPlayer.Character

							if character2 then
								local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart2 then
									humanoidRootPart2.CFrame = CFrame.new(head.Position + Vector3.new(0, 1.5, 0))
									task.wait(0.1)

									local ok, result = pcall(function()
										game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("PlayerFunc"):InvokeServer("handcuff", v8, false)
									end)

									if ok then
										v:Notify({ Title = "自动抓捕", Content = "已抓捕 " .. v8.Name, Duration = 1 })
									else
										v:Notify({ Title = "抓捕失败", Content = result or "未知错误", Duration = 1 })
									end
								end
							end
						end
					end
				else
					v:Notify({ Title = "自动抓捕", Content = "未找到通缉玩家", Duration = 1 })
				end
			end

			local autoArrestWantedInterval = tbl2.AutoArrestWantedInterval

			while autoArrestWantedInterval > 0 and flag3 and tbl2.AutoArrestWantedEnabled do
				task.wait(0.1)
				autoArrestWantedInterval -= 0.1
			end
		end

		flag3 = false
	end)
end

StopAutoArrestWanted = function()
	flag3 = false

	if thread then
		task.cancel(thread)
		thread = nil
	end
end

local function fn15(arg)
	if not tbl2.AimCheckWall then
		return true
	end
	local currentCamera2 = workspace.CurrentCamera
	if not currentCamera2 then
		return true
	end
	local position = currentCamera2.CFrame.Position
	local unit = (arg.Position - position).Unit
	local magnitude = (arg.Position - position).Magnitude
	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	raycastParams.FilterDescendantsInstances = { localPlayer.Character }
	local hit = workspace:Raycast(position, unit * magnitude, raycastParams)

	if hit then
		local instance = hit.Instance
		if instance and instance:IsDescendantOf(arg.Parent) then
			return true
		end
		return false
	end

	return true
end

local function fn16()
	if not tbl2.AimEnabled or flag2 then
		return
	end
	local currentCamera2 = workspace.CurrentCamera
	if not currentCamera2 then
		return
	end
	local v8 = localPlayer
	if not v8.Character then
		return
	end
	local vector2 = Vector2.new(currentCamera2.ViewportSize.X / 2, currentCamera2.ViewportSize.Y / 2)
	local aimMaxDistance = tbl2.AimMaxDistance
	local huge = math.huge
	local v9 = nil

	for _, player in ipairs(v5:GetPlayers()) do
		if player ~= v8 then
			if player.Character then
				local head = player.Character:FindFirstChild("Head")

				if head then
					if not (aimMaxDistance < (head.Position - currentCamera2.CFrame.Position).Magnitude) then
						local v10, v11 = currentCamera2:WorldToScreenPoint(head.Position)

						if v11 then
							if fn15(head) then
								local magnitude = (Vector2.new(v10.X, v10.Y) - vector2).Magnitude

								if magnitude <= 200 and magnitude < huge then
									huge = magnitude
									v9 = head
								end
							end
						end
					end
				end
			end
		end
	end

	if v9 then
		local n2 = 1 / (tbl2.AimSmoothness + 1)
		currentCamera2.CFrame = currentCamera2.CFrame:Lerp(CFrame.lookAt(currentCamera2.CFrame.Position, v9.Position), n2)
	end
end

ApplyHitbox = function()
	if flag2 or not tbl2.HitboxEnabled then
		return
	end
	local players = v5:GetPlayers()
	local tbl11 = {}

	for i = 1, #players do
		local v8 = players[i]

		if v8 ~= localPlayer and v8.Character then
			if not (tbl2.WhitelistEnabled and tbl7[v8.UserId]) then
				local character = v8.Character
				local head = character:FindFirstChild("Head")
				local humanoid = character:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoid.Health > 0 and head then
					head.Size = Vector3.new(tbl2.HitboxSize, tbl2.HitboxSize, tbl2.HitboxSize)
					head.Transparency = 1
					head.Color = Color3.fromRGB(255, 215, 0)
					head.Material = Enum.Material.Neon
					head.CanCollide = false
					tbl11[head] = true
				end
			end
		end
	end

	for k in pairs(tbl8) do
		if not tbl11[k] and k and k.Parent then
			k.Size = Vector3.new(2, 1, 1)
			k.Transparency = 0
			k.CanCollide = true
			k.Color = Color3.new(1, 1, 1)
			k.Material = Enum.Material.Plastic
		end
	end

	tbl8 = tbl11
end

ResetHitbox = function()
	for k in pairs(tbl8) do
		if k and k.Parent then
			k.Size = Vector3.new(2, 1, 1)
			k.Transparency = 0
			k.CanCollide = true
			k.Color = Color3.new(1, 1, 1)
			k.Material = Enum.Material.Plastic
		end
	end

	tbl8 = {}
end

UpdateWhitelist = function()
	if flag2 then
		return
	end
	tbl7 = {}
	local players = v5:GetPlayers()

	for i = 1, #players do
		local v8 = players[i]

		if v8 ~= localPlayer then
			pcall(function()
				if v8:IsFriendsWith(localPlayer.UserId) then
					tbl7[v8.UserId] = true
				end
			end)
		end
	end
end

local Players3 = game:GetService("Players")
local RunService_ = game:GetService("RunService")
local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
local localPlayer3 = Players3.LocalPlayer
local playerEvent = ReplicatedStorage2:WaitForChild("Remote"):WaitForChild("PlayerEvent")
local flag4 = false
local connection = nil
local n2 = 0
local n3 = 0.11

local function fn17(arg)
	if not arg then
		return
	end
	arg:WaitForChild("Humanoid")
	arg:WaitForChild("HumanoidRootPart")
end

local function fn18()
	local character = localPlayer3.Character
	if not character then
		return nil
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return nil
	end
	local position = humanoidRootPart.Position
	local killAuraRange = tbl2.KillAuraRange or 50
	local huge = math.huge
	local v8 = nil

	for _, player in ipairs(Players3:GetPlayers()) do
		if player ~= localPlayer3 then
			local character2 = player.Character

			if character2 then
				local humanoid = character2:FindFirstChildOfClass("Humanoid")

				if humanoid and humanoid.Health > 0 then
					local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart2 then
						local magnitude = (humanoidRootPart2.Position - position).Magnitude

						if magnitude < huge and magnitude <= killAuraRange then
							huge = magnitude
							v8 = player
						end
					end
				end
			end
		end
	end

	return v8
end

StartKillAura = function()
	if flag4 then
		return
	end
	flag4 = true
	tbl2.KillAuraEnabled = true

	if localPlayer.Character then
		fn17(localPlayer.Character)
	end

	connection = RunService_.Heartbeat:Connect(function()
		if not tbl2.KillAuraEnabled then
			StopKillAura()
			return
		end
		local now2 = tick()
		if now2 - n2 < n3 then
			return
		end
		local v8 = fn18()

		if v8 then
			local head = v8.Character and v8.Character:FindFirstChild("Head")

			if head then
				local character = localPlayer3.Character

				if character then
					local head2 = character:FindFirstChild("Head")

					if head2 then
						local position = head2.Position
						local position2 = head.Position
						local unit = (position2 - position).Unit

						pcall(function()
							playerEvent:FireServer("damage", { bodyParts = { { "Head", 100 } }, shotCode = { position, unit }, target = v8, pos = position2 })
						end)

						n2 = now2
					end
				end
			end
		end
	end)
end

StopKillAura = function()
	flag4 = false
	tbl2.KillAuraEnabled = false

	if connection then
		connection:Disconnect()
		connection = nil
	end
end

ToggleKillAura = function(killAuraEnabled)
	tbl2.KillAuraEnabled = killAuraEnabled

	if killAuraEnabled then
		StartKillAura()
	else
		StopKillAura()
	end
end

local flag5 = false
local connection2 = nil
local tbl11 = {}
local tbl12 = {}
local tbl13 = {}
local n4 = 0
local n5 = 20
local n6 = 30
local n7 = 2500

local function fn19()
	local character = localPlayer.Character
	if not character then
		return
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoidRootPart or not humanoid then
		return
	end
	local attribute = localPlayer:GetAttribute("WantedLevel")

	if not attribute or attribute <= 0 then
		for _, v8 in pairs(tbl12) do
			pcall(function()
				v8:Destroy()
			end)
		end

		for _, v8 in pairs(tbl13) do
			pcall(function()
				v8:Destroy()
			end)
		end

		table.clear(tbl12)
		table.clear(tbl13)
		return
	end

	local position = humanoidRootPart.Position
	local huge = math.huge
	local v8 = nil
	local flag6 = false

	for _, player in ipairs(Players3:GetPlayers()) do
		if player ~= localPlayer and player.Team and player.Team.Name == "Police" then
			local character2 = player.Character

			if character2 and character2:FindFirstChild("HumanoidRootPart") then
				local position2 = character2.HumanoidRootPart.Position
				local n8 = position.X - position2.X
				local n9 = position.Z - position2.Z
				local n10 = n8 * n8 + n9 * n9
				local flag7 = false

				if tbl11[player] then
					local v9 = tbl11[player]

					if n7 < (v9.X - position2.X) ^ 2 + (v9.Z - position2.Z) ^ 2 then
						n4 = 10
						flag7 = true
					end
				end

				tbl11[player] = position2

				if not tbl12[player] then
					local highlight = Instance.new("Highlight")
					highlight.FillColor = Color3.fromRGB(255, 0, 0)
					highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
					highlight.FillTransparency = 0.3
					highlight.OutlineTransparency = 0
					highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					highlight.Parent = character2
					tbl12[player] = highlight
				end

				local head = character2:FindFirstChild("Head")

				if head and not tbl13[player] then
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.AlwaysOnTop = true
					billboardGui.Size = UDim2.new(0, 120, 0, 50)
					billboardGui.StudsOffset = Vector3.new(0, 3.5, 0)
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextScaled = true
					textLabel.Font = Enum.Font.GothamBlack
					textLabel.Parent = billboardGui
					billboardGui.Parent = head
					tbl13[player] = billboardGui
				end

				if tbl13[player] then
					local v9 = math.sqrt(n10)
					tbl13[player].TextLabel.Text = string.format("[警察]\n%.1fm", v9)
				end

				if n10 < huge then
					huge = n10
					v8 = position2
					flag6 = flag7
				end
			end
		end
	end

	for k in pairs(tbl11) do
		if not k.Parent or not k.Team or k.Team.Name ~= "Police" then
			if tbl12[k] then
				pcall(function()
					tbl12[k]:Destroy()
				end)

				tbl12[k] = nil
			end

			if tbl13[k] then
				pcall(function()
					tbl13[k]:Destroy()
				end)

				tbl13[k] = nil
			end

			tbl11[k] = nil
		end
	end

	if v8 and huge < ((n4 > 0 or flag6) and n6 * n6 or n5 * n5) then
		local v9 = math.sqrt(huge)
		local n8 = position.X - v8.X
		local n9 = position.Z - v8.Z
		local n10, n11

		if v9 > 0.001 then
			n10 = n8 / v9
			n11 = n9 / v9
		else
			local n12 = math.random() * 2 * 3.1415926535897931
			n10 = math.cos(n12)
			n11 = math.sin(n12)
		end

		local noDizzinessSpeed = tbl2.NoDizzinessSpeed or 24

		if humanoid and humanoid.SeatPart then
			pcall(function()
				local seatPart = humanoid.SeatPart
				seatPart.Velocity = Vector3.new(n10 * 40, seatPart.Velocity.Y, n11 * 40)
			end)
		else
			humanoidRootPart.AssemblyLinearVelocity = Vector3.new(n10 * noDizzinessSpeed, humanoidRootPart.AssemblyLinearVelocity.Y, n11 * noDizzinessSpeed)
		end
	end

	if localPlayer:GetAttribute("EscortedBy") then
		localPlayer:SetAttribute("EscortedBy", nil)

		if v8 then
			local n8 = position.X - v8.X
			local n9 = position.Z - v8.Z
			local v9 = math.sqrt(n8 * n8 + n9 * n9)

			if v9 > 0.001 then
				humanoidRootPart.CFrame = humanoidRootPart.CFrame - humanoidRootPart.CFrame.Position + position + Vector3.new(n8 / v9, 0, n9 / v9) * 15
			end
		end
	end

	if humanoid.Sit then
		humanoid.Sit = false
		humanoid:ChangeState(Enum.HumanoidStateType.Running)
	end

	if n4 > 0 then
		n4 -= 1
	end
end

local function fn20()
	if flag5 then
		return
	end
	flag5 = true
	tbl2.AntiPolicePushEnabled = true

	connection2 = RunService_.RenderStepped:Connect(function()
		if not tbl2.AntiPolicePushEnabled then
			StopAntiPolice()
			return
		end
		fn19()
	end)
end

local function fn21()
	flag5 = false
	tbl2.AntiPolicePushEnabled = false

	if connection2 then
		connection2:Disconnect()
		connection2 = nil
	end

	for _, v8 in pairs(tbl12) do
		pcall(function()
			v8:Destroy()
		end)
	end

	for _, v8 in pairs(tbl13) do
		pcall(function()
			v8:Destroy()
		end)
	end

	table.clear(tbl12)
	table.clear(tbl13)
	table.clear(tbl11)
	n4 = 0
end

ToggleAntiPolice = function(antiPolicePushEnabled)
	tbl2.AntiPolicePushEnabled = antiPolicePushEnabled

	if antiPolicePushEnabled then
		fn20()
	else
		fn21()
	end
end

local connection3 = nil

local function fn22()
	local world = workspace:FindFirstChild("World")
	world = world and world:FindFirstChild("Interactive")
	world = world and world:FindFirstChild("Intersections")
	if not world then
		return
	end

	for _, descendant in ipairs(world:GetDescendants()) do
		if descendant.Name == "_TrafficLightArea" then
			pcall(function()
				descendant:Destroy()
			end)
		end
	end
end

local function fn23()
	if connection3 then
		return
	end
	fn22()
	local world = workspace:FindFirstChild("World")
	world = world and world:FindFirstChild("Interactive")
	world = world and world:FindFirstChild("Intersections")
	if not world then
		return
	end

	connection3 = world.DescendantAdded:Connect(function(descendant)
		if descendant.Name == "_TrafficLightArea" then
			task.defer(function()
				if descendant and descendant.Parent then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end)
		end
	end)
end

local function fn24()
	if connection3 then
		connection3:Disconnect()
		connection3 = nil
	end
end

local connection4 = nil

StartNoDizziness = function()
	if connection4 then
		return
	end

	connection4 = RunService_.RenderStepped:Connect(function()
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChild("Humanoid")
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not humanoidRootPart then
			return
		end
		local moveDirection = humanoid.MoveDirection

		if moveDirection.Magnitude > 0 then
			local noDizzinessSpeed = tbl2.NoDizzinessSpeed or 24
			humanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDirection.X * noDizzinessSpeed, humanoidRootPart.AssemblyLinearVelocity.Y, moveDirection.Z * noDizzinessSpeed)
		end
	end)
end

StopNoDizziness = function()
	if connection4 then
		connection4:Disconnect()
		connection4 = nil
	end

	local character = localPlayer.Character

	if character then
		local humanoid = character:FindFirstChild("Humanoid")
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

		if humanoid and humanoidRootPart then
			local moveDirection = humanoid.MoveDirection

			if moveDirection.Magnitude > 0 then
				local walkSpeed = humanoid.WalkSpeed
				humanoidRootPart.AssemblyLinearVelocity = Vector3.new(moveDirection.X * walkSpeed, humanoidRootPart.AssemblyLinearVelocity.Y, moveDirection.Z * walkSpeed)
			end
		end
	end
end

task.spawn(function()
	task.wait(0.5)
	local currentCamera2 = workspace.CurrentCamera

	local function fn25()
		if not tbl2.BulletTrackEnabled then
			return nil
		end
		local cFrame = currentCamera2.CFrame
		local position = cFrame.Position
		local lookVector = cFrame.LookVector
		local screenMode = tbl2.ScreenMode
		local distanceMode = tbl2.DistanceMode

		if not screenMode and not distanceMode then
			screenMode = true
		end

		if distanceMode and not screenMode then
			local huge = math.huge
			local v8 = nil

			for _, player in ipairs(Players3:GetPlayers()) do
				if not (player == localPlayer or not player.Character) then
					local head = player.Character:FindFirstChild("Head")

					if head then
						local magnitude = (head.Position - position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v8 = head
						end
					end
				end
			end

			return v8
		end

		local n8 = -1
		local v8 = nil

		for _, player in pairs(Players3:GetPlayers()) do
			if player ~= localPlayer and player.Character then
				local head = player.Character:FindFirstChild("Head")

				if head then
					local v9 = lookVector:Dot((head.Position - position).Unit)

					if v9 > 0.2 and v9 > n8 then
						n8 = v9
						v8 = head
					end
				end
			end
		end

		if v8 then
			return v8
		end
		local huge = math.huge
		local v9 = nil

		for _, player in pairs(Players3:GetPlayers()) do
			if player ~= localPlayer and player.Character then
				local head = player.Character:FindFirstChild("Head")

				if head then
					local magnitude = (head.Position - position).Magnitude

					if magnitude < huge then
						huge = magnitude
						v9 = head
					end
				end
			end
		end

		return v9
	end

	local ok, result = pcall(require, game:GetService("ReplicatedStorage").Modules.Algorithms)

	if ok and result and type(result.bulletSpread) == "function" then
		local bulletSpread = result.bulletSpread

		result.bulletSpread = function(arg, arg2)
			if tbl2.BulletTrackEnabled then
				local v8 = fn25()

				if v8 then
					arg = (v8.Position - currentCamera2.CFrame.Position).Unit
				end
			end

			return bulletSpread(arg, arg2)
		end

		local tbl14 = getmetatable(result) or {}
		setmetatable(result, { __index = tbl14.__index, __newindex = tbl14.__newindex })
	end
end)

local connection5 = nil
local tbl14 = {}

local function fn25()
	local character = localPlayer.Character
	if not character then
		return
	end
	local tool = character:FindFirstChildOfClass("Tool")

	if not tool then
		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("Tool") then
				tool = child
				break
			elseif child:IsA("Model") and (child:FindFirstChild("Handle") or child:FindFirstChild("Config")) then
				tool = child
				break
			end
		end
	end

	if not tool then
		return
	end
	local config = tool:FindFirstChild("Config")
	if not config or not config:IsA("ModuleScript") then
		return
	end
	local ok, result = pcall(require, config)
	if not ok or type(result) ~= "table" then
		return
	end

	if not tbl14[tool] then
		tbl14[tool] = true

		pcall(function()
			local tbl15 = getmetatable(result) or {}

			setmetatable(result, {
				__index = tbl15.__index,
				__newindex = function(arg, arg2, arg3)
					local v8 = string.lower(arg2)

					if v8 == "rpm" or v8 == "firerate" or v8 == "rate" then
						arg3 = tbl2.RPMTarget
					end

					rawset(arg, arg2, arg3)
				end,
				__metatable = tbl15,
			})
		end)
	end

	for k in pairs(result) do
		if type(result[k]) == "number" then
			local v8 = string.lower(k)

			if v8 == "rpm" or v8 == "firerate" or v8 == "rate" then
				if result[k] ~= tbl2.RPMTarget then
					pcall(function()
						rawset(result, k, tbl2.RPMTarget)
					end)
				end
			end
		end
	end
end

StartRPMHack = function()
	if connection5 then
		return
	end
	tbl14 = {}

	connection5 = RunService_.RenderStepped:Connect(function()
		if not tbl2.RPMEnabled then
			StopRPMHack()
			return
		end
		fn25()
	end)

	fn25()
end

StopRPMHack = function()
	if connection5 then
		connection5:Disconnect()
		connection5 = nil
	end

	tbl14 = {}
end

local connection6 = nil
local tbl15 = {}

local function fn26()
	local character = localPlayer.Character
	if not character then
		return
	end
	local tool = character:FindFirstChildOfClass("Tool")

	if not tool then
		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("Tool") then
				tool = child
				break
			elseif child:IsA("Model") and (child:FindFirstChild("Handle") or child:FindFirstChild("Config")) then
				tool = child
				break
			end
		end
	end

	if not tool then
		return
	end
	local config = tool:FindFirstChild("Config")
	if not config then
		return
	end

	if not tbl15[tool] then
		tbl15[tool] = true

		for _, child in ipairs(config:GetChildren()) do
			local v8 = string.lower(child.Name)

			if (string.find(v8, "ammo") or string.find(v8, "magazine") or string.find(v8, "bullet") or string.find(v8, "clip") or string.find(v8, "total")) and (child:IsA("NumberValue") or child:IsA("IntValue")) then
				child.Changed:Connect(function()
					if tbl2.InfiniteAmmoEnabled then
						child.Value = 999
					end
				end)
			end
		end
	end

	for _, child in ipairs(config:GetChildren()) do
		local v8 = string.lower(child.Name)

		if (string.find(v8, "ammo") or string.find(v8, "magazine") or string.find(v8, "bullet") or string.find(v8, "clip") or string.find(v8, "total")) and (child:IsA("NumberValue") or child:IsA("IntValue")) then
			if child.Value ~= 999 then
				child.Value = 999
			end
		end
	end
end

StartInfiniteAmmo = function()
	if connection6 then
		return
	end
	tbl15 = {}

	connection6 = RunService_.RenderStepped:Connect(function()
		if not tbl2.InfiniteAmmoEnabled then
			StopInfiniteAmmo()
			return
		end
		fn26()
	end)

	fn26()
end

StopInfiniteAmmo = function()
	if connection6 then
		connection6:Disconnect()
		connection6 = nil
	end

	tbl15 = {}
end

local thread2 = nil
local flag6 = false
local hackingMinigame = nil
local v8 = nil

local function fn27()
	if flag6 then
		return true
	end
	local localPlayer4 = game.Players.LocalPlayer
	local framework = localPlayer4:FindFirstChild("PlayerScripts") and localPlayer4.PlayerScripts:FindFirstChild("Framework")
	if not framework then
		return false
	end
	local ok, result = pcall(require, framework.Character)
	if not ok then
		return false
	end

	if not result or type(result.hackingMinigame) ~= "function" then
		return false
	end
	v8 = result
	hackingMinigame = result.hackingMinigame

	result.hackingMinigame = function(arg, arg2, arg3, arg4)
		if arg == "ATM Hack" then
			return true
		end
		return hackingMinigame(arg, arg2, arg3, arg4)
	end

	flag6 = true
	return true
end

local function fn28()
	if thread2 then
		return
	end

	thread2 = task.spawn(function()
		while true do
			if tbl2.AutoATMHack and not flag2 then
				if not fn27() then
					task.wait(0.3)
					continue
				end
			end

			break
		end
	end)
end

local function fn29()
	if thread2 then
		task.cancel(thread2)
		thread2 = nil
	end

	if flag6 and v8 and hackingMinigame then
		v8.hackingMinigame = hackingMinigame
		flag6 = false
		v8 = nil
		hackingMinigame = nil
	end
end

local flag7 = false
local hackingMinigame2 = nil
local v9 = nil
local thread3 = nil

local function fn30()
	if flag7 then
		return true
	end
	local localPlayer4 = game.Players.LocalPlayer
	local framework = localPlayer4:FindFirstChild("PlayerScripts") and localPlayer4.PlayerScripts:FindFirstChild("Framework")
	if not framework then
		return false
	end
	local ok, result = pcall(require, framework.Character)
	if not ok then
		return false
	end

	if not result or type(result.hackingMinigame) ~= "function" then
		return false
	end
	v9 = result
	hackingMinigame2 = result.hackingMinigame

	result.hackingMinigame = function()
		return true
	end

	flag7 = true
	return true
end

local function fn31()
	if not flag7 then
		return
	end

	if v9 and hackingMinigame2 then
		v9.hackingMinigame = hackingMinigame2
	end

	flag7 = false
	hackingMinigame2 = nil
	v9 = nil
end

local function fn32()
	if thread3 then
		return
	end

	thread3 = task.spawn(function()
		while true do
			if tbl2.AutoAllHack and not flag2 then
				if not fn30() then
					task.wait(0.3)
					continue
				end
			end

			break
		end

		thread3 = nil
	end)
end

local function fn33()
	if thread3 then
		task.cancel(thread3)
		thread3 = nil
	end

	fn31()
end

local v10 = v:CreateWindow({
	Title = "ANSN HUB v4 付费",
	Icon = "target",
	Author = "作者Sv.Sm.Op.Loy.代理Wu",
	Size = UDim2.fromOffset(600, 500),
	Theme = "Indigo",
	SideBarWidth = 180,
	ScrollBarEnabled = true,
	KeySystem = { Title = "卡密激活", Note = "本机设备ID：" .. v2 .. "\n输入KAMI开头卡密完成激活校验 严厉禁止两人一卡", KeyValidator = fn5 },
})

local function fn34()
	if not v10 then
		return
	end
	local flag8 = false

	if v10.Toggle then
		v10:Toggle()
		flag8 = true
	end

	if not flag8 and v10.Visible ~= nil then
		v10.Visible = not v10.Visible
		flag8 = true
	end

	if not flag8 and v10.Frame then
		v10.Frame.Visible = not v10.Frame.Visible
		flag8 = true
	end

	if not flag8 and v10.Parent and v10:IsA("ScreenGui") then
		v10.Enabled = not v10.Enabled
		flag8 = true
	end

	if not flag8 then
		warn("无法切换菜单")
	end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if input.KeyCode == Enum.KeyCode.Insert then
		fn34()

		pcall(function()
			if v.Notify then
				v:Notify({ Title = "菜单", Content = "已切换", Duration = 0.5 })
			end
		end)
	end
end)

v10:CreateTopbarButton("theme-switcher", "moon", function()
	v:SetTheme(v:GetCurrentTheme() == "Indigo" and "Dark" or "Indigo")
	v:Notify({ Title = "主题", Content = "切换为 " .. v:GetCurrentTheme(), Duration = 2 })
end, 990)

local v11 = v10:Section({ Title = "主要功能", Opened = true })
local v12 = v11:Tab({ Title = "交互设置", Icon = "hand" })

v12:Slider({
	Title = "按住时间",
	Desc = "ProximityPrompt 按住时长",
	Value = { Min = 0, Max = 10, Default = 0 },
	Callback = function(holdTime)
		tbl2.HoldTime = holdTime

		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("ProximityPrompt") then
				descendant.HoldDuration = holdTime
			end
		end
	end,
})

v12:Slider({
	Title = "触发距离",
	Desc = "ProximityPrompt 最大距离",
	Value = { Min = 5, Max = 150, Default = 25 },
	Callback = function(distance)
		tbl2.Distance = distance

		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("ProximityPrompt") then
				descendant.MaxActivationDistance = distance
			end
		end
	end,
})

local v13 = v11:Tab({ Title = "警察", Icon = "badge" })

v13:Toggle({
	Title = "自动全图逮捕",
	Desc = "刷警察等级快被挂dc别怪我们",
	Value = false,
	Callback = function(autoArrestWantedEnabled)
		tbl2.AutoArrestWantedEnabled = autoArrestWantedEnabled

		if autoArrestWantedEnabled then
			StartAutoArrestWanted()
		else
			StopAutoArrestWanted()
		end
	end,
})

v13:Slider({
	Title = "逮捕间隔",
	Desc = "每次抓捕后的等待时间建议≥1秒",
	Value = { Min = 0.5, Max = 10, Default = 1.5 },
	Callback = function(autoArrestWantedInterval)
		tbl2.AutoArrestWantedInterval = autoArrestWantedInterval
	end,
})

v12:Divider()

v12:Toggle({
	Title = "启用人物穿墙",
	Desc = "无视碰撞，自由移动",
	Value = false,
	Callback = function(arg)
		fn12(arg)
	end,
})

local v14 = v11:Tab({ Title = "战斗", Icon = "crosshair" })

v14:Toggle({
	Title = "杀戮光环",
	Desc = "自动攻击范围内敌人",
	Value = false,
	Callback = function(arg)
		ToggleKillAura(arg)
	end,
})

v14:Slider({
	Title = "杀戮光环距离",
	Desc = "攻击范围",
	Value = { Min = 1, Max = 1000, Default = 50 },
	Callback = function(killAuraRange)
		tbl2.KillAuraRange = killAuraRange
	end,
})

v14:Toggle({
	Title = "启用头部碰撞箱",
	Desc = "放大敌人头部 Hitbox",
	Value = false,
	Callback = function(hitboxEnabled)
		tbl2.HitboxEnabled = hitboxEnabled

		if hitboxEnabled then
			ApplyHitbox()
		else
			ResetHitbox()
		end
	end,
})

v14:Slider({
	Title = "头部大小",
	Desc = "碰撞箱尺寸",
	Value = { Min = 5, Max = 40, Default = 10 },
	Callback = function(hitboxSize)
		tbl2.HitboxSize = hitboxSize

		if tbl2.HitboxEnabled then
			ApplyHitbox()
		end
	end,
})

v14:Toggle({
	Title = "好友检测 (白名单)",
	Desc = "不对好友生效碰撞箱",
	Value = false,
	Callback = function(whitelistEnabled)
		tbl2.WhitelistEnabled = whitelistEnabled

		if whitelistEnabled then
			UpdateWhitelist()
		end
	end,
})

v14:Divider()

v14:Toggle({
	Title = "启用射速修改（不可用）",
	Desc = "修改当前武器 RPM（射速）",
	Value = false,
	Callback = function(rpmEnabled)
		tbl2.RPMEnabled = rpmEnabled

		if rpmEnabled then
			StartRPMHack()
		else
			StopRPMHack()
		end
	end,
})

v14:Slider({
	Title = "目标 RPM（不可用）",
	Desc = "射速值（越大越快）",
	Value = { Min = 100, Max = 9999, Default = 1800 },
	Callback = function(rpmTarget)
		tbl2.RPMTarget = rpmTarget

		if tbl2.RPMEnabled then
			fn25()
		end
	end,
})

v14:Divider()

v14:Toggle({
	Title = "启用无限子弹（不可用）",
	Desc = "当前武器弹药锁定为 999",
	Value = false,
	Callback = function(infiniteAmmoEnabled)
		tbl2.InfiniteAmmoEnabled = infiniteAmmoEnabled

		if infiniteAmmoEnabled then
			StartInfiniteAmmo()
		else
			StopInfiniteAmmo()
		end
	end,
})

local v15 = v11:Tab({ Title = "自瞄", Icon = "target" })

v15:Toggle({
	Title = "启用自瞄",
	Desc = "自动瞄准最近敌人头部",
	Value = false,
	Callback = function(aimEnabled)
		tbl2.AimEnabled = aimEnabled
	end,
})

v15:Slider({
	Title = "平滑度",
	Desc = "数值越小越灵敏",
	Value = { Min = 1, Max = 20, Default = 5 },
	Callback = function(aimSmoothness)
		tbl2.AimSmoothness = aimSmoothness
	end,
})

v15:Slider({
	Title = "检测距离",
	Desc = "最大锁定距离",
	Value = { Min = 50, Max = 500, Default = 200 },
	Callback = function(aimMaxDistance)
		tbl2.AimMaxDistance = aimMaxDistance
	end,
})

v15:Toggle({
	Title = "墙壁检测",
	Desc = "忽略被墙遮挡的目标",
	Value = true,
	Callback = function(aimCheckWall)
		tbl2.AimCheckWall = aimCheckWall
	end,
})

local v16 = v11:Tab({ Title = "移动增强", Icon = "move" })

v16:Toggle({
	Title = "无眩晕",
	Desc = "消除减速并提升速度",
	Value = false,
	Callback = function(noDizziness)
		tbl2.NoDizziness = noDizziness

		if noDizziness then
			StartNoDizziness()
		else
			StopNoDizziness()
		end
	end,
})

v16:Slider({
	Title = "移动速度",
	Desc = "无眩晕时的速度",
	Value = { Min = 5, Max = 250, Default = 24 },
	Callback = function(noDizzinessSpeed)
		tbl2.NoDizzinessSpeed = noDizzinessSpeed
	end,
})

v11:Tab({ Title = "ESP透视", Icon = "eye" }):Toggle({
	Title = "启用ESP透视",
	Desc = "显示玩家盒子、血量、名称等",
	Value = false,
	Callback = function(skeletonEnabled)
		tbl2.SkeletonEnabled = skeletonEnabled

		if tbl and tbl.Enabled ~= nil then
			tbl.Enabled = skeletonEnabled
			tbl.Drawing.Boxes.Skeleton.Enabled = skeletonEnabled
		end
	end,
})

local v17 = v11:Tab({ Title = "自动赚钱", Icon = "dollar-sign" })

v17:Toggle({
	Title = "自动破解ATM",
	Desc = "破解ATM",
	Value = false,
	Callback = function(autoATMHack)
		tbl2.AutoATMHack = autoATMHack

		if autoATMHack then
			fn28()
		else
			fn29()
		end
	end,
})

v17:Toggle({
	Title = "一键破解全部",
	Desc = "适配所有破解系统",
	Value = false,
	Callback = function(autoAllHack)
		tbl2.AutoAllHack = autoAllHack

		if autoAllHack then
			fn32()
		else
			fn33()
		end
	end,
})

local v18 = v11:Tab({ Title = "子弹追踪", Icon = "crosshair" })

v18:Toggle({
	Title = "启用子弹追踪",
	Desc = "自动追踪敌人头部",
	Value = false,
	Callback = function(bulletTrackEnabled)
		tbl2.BulletTrackEnabled = bulletTrackEnabled
	end,
})

v18:Divider()

v18:Toggle({
	Title = "屏幕中心优先",
	Desc = "屏幕中心优先",
	Value = true,
	Callback = function(screenMode)
		tbl2.ScreenMode = screenMode
	end,
})

v18:Toggle({
	Title = "距离优先",
	Desc = "锁定最近的敌人",
	Value = false,
	Callback = function(distanceMode)
		tbl2.DistanceMode = distanceMode
	end,
})

local v19 = v11:Tab({ Title = "远程商店", Icon = "cart" })
v19:Section({ Title = "黑市道具", Opened = true })

v19:Button({
	Title = "解密电路",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Black Market/1", "Decryption Circuit", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "绿色USB",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Black Market/5", "Green USB", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "喷漆",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Black Market/8", "Crew Graffiti", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "购买C4",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Black Market/4", "C4", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "购买入侵工具",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Black Market/3", "Hacking Tool", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "购买撬锁工具",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Black Market/2", "Lockpick Device", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Divider()
v19:Section({ Title = "近战武器", Opened = true })

v19:Button({
	Title = "小刀",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Weapons/1", "Knife", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "斧子",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Weapons/2", "Battle Axe", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "棒球棍",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Weapons/3", "Bat", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "大砍刀",
	Callback = function()
		local ok, result = pcall(function()
			local v20, v21 = BuyItem("Weapons/4", "Machete", 1, false)
			v:Notify({ Title = v20 and "购买成功" or "购买失败", Content = tostring(v21), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Divider()
v19:Section({ Title = "通用物品", Opened = true })

v19:Button({
	Title = "望远镜",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Binoculars", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "降落伞",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Black Parachute", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "钓鱼竿",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Fishing Rod", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "金属探测仪",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Metal Detector", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "铲子",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Trowel", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "摄像头",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "News Camera", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "麦克风",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "News Microphone", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "口袋",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Pocket", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "雨伞",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Red Umbrella", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "车辆维修包",
	Callback = function()
		local ok, result = pcall(function()
			local Items, v20 = BuyItem("Items", "Repair Kit", 1, false)
			v:Notify({ Title = Items and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Divider()
v19:Section({ Title = "食品补给", Opened = true })

v19:Button({
	Title = "小蛋糕",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Cupcake", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "三明治",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Sandwich", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "汽水",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Soda Can", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "沙拉",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Salad", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "饼干",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Cookie", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "冰茶",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Iced Tea", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "松饼卷",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Croissant", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "苹果",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Apple", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "苹果汁",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Apple Juice", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

v19:Button({
	Title = "牛奶",
	Callback = function()
		local ok, result = pcall(function()
			local Food, v20 = BuyItem("Food", "Box Of Milk", 1, false)
			v:Notify({ Title = Food and "购买成功" or "购买失败", Content = tostring(v20), Duration = 2 })
		end)

		if not ok then
			v:Notify({ Title = "按钮执行错误", Content = tostring(result), Duration = 3 })
		end
	end,
})

local v20 = v11:Tab({ Title = "罪犯", Icon = "skull" })

v20:Toggle({
	Title = "躲避警察",
	Desc = "高亮警察并自动跑动远离",
	Value = false,
	Callback = function(arg)
		ToggleAntiPolice(arg)
	end,
})

v20:Divider()

v20:Toggle({
	Title = "取消红绿灯通缉",
	Desc = "摧毁红绿灯区域，避免被通缉",
	Value = false,
	Callback = function(trafficLightWantedEnabled)
		tbl2.TrafficLightWantedEnabled = trafficLightWantedEnabled

		if trafficLightWantedEnabled then
			fn23()
		else
			fn24()
		end
	end,
})

local v21 = v10:Section({ Title = "传送点", Opened = true }):Tab({ Title = "传送", Icon = "map-pin" })

v21:Toggle({
	Title = "启用传送",
	Desc = "允许点击传送按钮",
	Value = false,
	Callback = function(teleportEnabled)
		tbl2.TeleportEnabled = teleportEnabled
	end,
})

v21:Divider()

local function fn35()
	local tbl16 = {}

	for _, v22 in ipairs(v7) do
		if not tbl16[v22.region] then
			tbl16[v22.region] = {}
		end

		table.insert(tbl16[v22.region], v22)
	end

	local tbl17 = {}

	for k in pairs(tbl16) do
		table.insert(tbl17, k)
	end

	table.sort(tbl17)

	for _, v22 in ipairs(tbl17) do
		v21:Divider()

		for _, v23 in ipairs(tbl16[v22]) do
			v21:Button({
				Title = v22 .. " - " .. v23.n,
				Callback = function()
					fn10(v23.p)
					v:Notify({ Title = "传送", Content = "正在传送至: " .. v23.n, Duration = 2 })
				end,
			})
		end
	end
end

task.spawn(function()
	task.wait(0.5)

	if not flag2 then
		fn35()
	end
end)

v10:Section({ Title = "设置", Opened = true }):Tab({ Title = "设置", Icon = "settings" }):Button({
	Title = "卸载 ANSN HUB",
	Callback = function()
		v10:Destroy()
	end,
	Danger = true,
})

v10:OnDestroy(function()
	if flag2 then
		return
	end
	flag2 = true
	ResetHitbox()
	StopNoDizziness()
	StopRPMHack()
	StopInfiniteAmmo()
	fn29()
	fn33()
	StopAutoArrestWanted()
	fn21()
	fn24()

	if tbl2.NoclipEnabled then
		fn12(false)
	end

	for _, v22 in ipairs(tbl9) do
		pcall(function()
			v22:Disconnect()
		end)
	end

	for _, v22 in ipairs(tbl10) do
		pcall(function()
			v22:Disconnect()
		end)
	end

	local espHolder2 = game.CoreGui:FindFirstChild("ESPHolder")

	if espHolder2 then
		espHolder2:Destroy()
	end

	print("ANSN卸载成功再见")
end)

local function fn36(player)
	player.CharacterAdded:Connect(function()
		task.wait(0.5)

		if tbl2.HitboxEnabled and not flag2 then
			task.wait(0.5)
			ApplyHitbox()
		end

		if tbl2.NoclipEnabled and not flag2 then
			task.wait(0.1)
			fn11()
		end
	end)

	if tbl2.WhitelistEnabled and not flag2 then
		UpdateWhitelist()
	end
end

for _, player in ipairs(Players3:GetPlayers()) do
	fn36(player)
end

local connection7 = Players3.PlayerAdded:Connect(fn36)
table.insert(tbl9, connection7)

local connection8 = RunService_.RenderStepped:Connect(function()
	if flag2 then
		return
	end

	if tbl2.HitboxEnabled then
		n += 1

		if n % 3 == 0 then
			ApplyHitbox()
		end
	end

	if tbl2.NoclipEnabled then
		fn11()
	end

	if tbl2.AimEnabled then
		fn16()
	end
end)

table.insert(tbl9, connection8)

task.spawn(function()
	while not flag2 do
		task.wait(10)

		if tbl2.WhitelistEnabled and not flag2 then
			UpdateWhitelist()
		end
	end
end)

local function fn37()
	if flag2 then
		return
	end

	for _, descendant in ipairs(workspace:GetDescendants()) do
		if descendant:IsA("ProximityPrompt") then
			descendant.HoldDuration = tbl2.HoldTime
			descendant.MaxActivationDistance = tbl2.Distance
		end
	end
end

fn37()

local connection9 = workspace.DescendantAdded:Connect(function(descendant)
	if flag2 then
		return
	end

	if descendant:IsA("ProximityPrompt") then
		descendant.HoldDuration = tbl2.HoldTime
		descendant.MaxActivationDistance = tbl2.Distance
	end
end)

table.insert(tbl9, connection9)
print("ANSN加载成功")
