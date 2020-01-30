if GetLocale() == "koKR" then
	guildhi_string = {
		["MEMBER_LOGIN"] = "길드 멤버 [%s]님이 게임에 접속하였습니다.",
		["MEMBER_LOGOUT"] = "길드 멤버 [%s]님이 게임을 종료하였습니다.",
		["HI"] = "%s님! 안녕하세요! 환영합니다! 반갑습니다! 어서오세요!",
		["BYE"] = "%s님! OK~♪, Bye!~♪♪",
		["WELCOME_JOIN"] = "%s님, 저희 길드에 가입하신 것을 환영합니다! 반갑습니다! 즐깸해요!",
	}
else
	guildhi_string = {
		["MEMBER_LOGIN"] = "Guild member login : %s",
		["MEMBER_LOGOUT"] = "Guild member logout : %s",
		["HI"] = "! Hello!",
		["BYE"] = "! OK~♪, Bye!~♫",
		["WELCOME_JOIN"] = "Welcome to Guild! %s!",
	}
end
