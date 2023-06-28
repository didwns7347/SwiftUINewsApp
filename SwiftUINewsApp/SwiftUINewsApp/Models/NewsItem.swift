//
//  NewsItem.swift
//  SwiftUINewsApp
//
//  Created by yangjs on 2023/06/28.
//

import Foundation

struct NewsResponseModel: Decodable {
    var items: [News] = []
}

struct News: Decodable {
 
    let title: String
    let link: String
    let originallink :String
    let description: String
    let pubDate: String
    
    var dateString : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, d MM yyyy HH:mm:ss Z"
        dateFormatter.locale = .current
        let date = dateFormatter.date(from: pubDate) ?? Date()
        let transFormatter = "yyyy년 MM월 dd일 HH:mm:ss"
        dateFormatter.dateFormat = transFormatter
        return dateFormatter.string(from: date)
    }
}
extension News {
    static var sampleDatas: [News]{
        let samples =
        """
        {
         "items": [
                {
                    "title": "DL이앤씨, 혁신기술 가진 유망 스타트업 발굴",
                    "originallink": "https://www.sedaily.com/NewsView/29R14UU8YQ",
                    "link": "https://n.news.naver.com/mnews/article/011/0004207290?sid=101",
                    "description": "DL이앤씨는 서울시 출연기관인 서울<b>경제</b>진흥원에서 운영하는 서울창업허브 성수·창동과 함께 오픈... 올해는 서울<b>경제</b>진흥원 서울창업허브 성수·창동과의 공동 주최를 통해 공모 참여 업체가 더욱 확대될 것으로... ",
                    "pubDate": "Wed, 28 Jun 2023 11:25:00 +0900"
                },
                {
                    "title": "CJ대한통운, 미국에 최대 6000억원 규모 물류센터 구축",
                    "originallink": "https://www.econovill.com/news/articleView.html?idxno=615931",
                    "link": "https://www.econovill.com/news/articleView.html?idxno=615931",
                    "description": "공동 프로젝트를 통해 우리 기업의 수출입화물을 우선 취급해 K상품 해외진출을 지원하고 미국 현지 투자와 고용창출로 한미 <b>경제</b>동맹 강화에 기여할 수 있다는 분석이 나온다. CJ대한통운은 한국해양진흥공사(공사)와... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "SBA 서울창업허브 성수·창동, DL이앤씨와 오픈이노베이션 참가기업 모집",
                    "originallink": "https://www.megaeconomy.co.kr/news/newsview.php?ncode=1065579347023931",
                    "link": "https://www.megaeconomy.co.kr/news/newsview.php?ncode=1065579347023931",
                    "description": "서울<b>경제</b>진흥원(옛 서울산업진흥원, SBA, 대표 김현우)에서 운영하는 서울창업허브 성수·창동 센터는... 서울<b>경제</b>진흥원은 서울시 스타트업의 스케일업을 통해 글로벌 경쟁력을 만드는 중소기업 지원기관이다.... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "천안시개발위·시의회, 대통령 공약 &apos;GTX-C 노선 천안 연장&apos; 이행 촉구",
                    "originallink": "http://www.ccnnews.co.kr/news/articleView.html?idxno=299562",
                    "link": "http://www.ccnnews.co.kr/news/articleView.html?idxno=299562",
                    "description": "그러면서 &quot;GTX-C 노선이 평택을 거쳐 천안까지 연장되면 천안이 수도권 광역화 범주에 포함되고, 수도권 배후 핵심도시의 역할이 가능할 것&quot;이라며 &quot;원도심 재도약과 지방<b>경제</b> 활성화로 인한 국토균형발전으로 지속적인... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "영천시 “소상공인 카드수수료 지원금 신청하세요” 외 [영천소식]",
                    "originallink": "http://www.kukinews.com/newsView/kuk202306280076",
                    "link": "http://www.kukinews.com/newsView/kuk202306280076",
                    "description": "지원금 신청은 온라인 또는 경북<b>경제</b>진흥원 영천 출장소로 하면된다. 최기문 영천시장은 “이번 지원을 통해 소상공인들이 조금이나마 도움이 되길 바란다”며 “앞으로도 다양한 맞춤형 지원방안을 발굴해... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "송인헌 괴산군수, 민선8기 1주년 맞아 군정성과 발표",
                    "originallink": "https://www.ccdailynews.com/news/articleView.html?idxno=2213152",
                    "link": "https://www.ccdailynews.com/news/articleView.html?idxno=2213152",
                    "description": "또 지역<b>경제</b> 살리는 체류형 관광산업을 제시했다. 송 군수는 &quot;청정 자연의 이미지를 적극 활용한 괴산형... 지역<b>경제</b>를 활성화하겠다&quot;고 말했다. 이어, 송 군수는 &quot;농업경쟁력 강화로 지속 가능한 농촌을 만들어가겠다... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "해수부 “7월부터 전국 해수욕장 순차 개장… 매주 방사능 검사 실시”",
                    "originallink": "https://www.viva100.com/main/view.php?key=20230628010008045",
                    "link": "https://www.viva100.com/main/view.php?key=20230628010008045",
                    "description": "만약 오염수가 방류된다면 매주 방사능 검사를 실시해 국민들이 안심하고 해수욕장을 방문할 수 있도록 하고 부정확한 정보 확산으로 인근 상인이나 지역<b>경제</b>에 피해가 발생하지 않도록 지자체와 엄정 대응한다는... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "“과학기술·리더십 패러다임 10년 후 국가의 운명 결정” [이노베이트 코리아...",
                    "originallink": "http://news.heraldcorp.com/view.php?ud=20230628000377",
                    "link": "https://n.news.naver.com/mnews/article/016/0002162176?sid=105",
                    "description": "안 의원은 “미·중 사이가 좋을 때는 눈치보지 않고 ‘안보는 미국, <b>경제</b>는 중국’에 맡기면서 우리나라는 고속 성장해왔다”며 “둘 중 한 나라에 의존해야 하는 상황에 내몰린 지금은 어떻게 연착륙할 것인가”... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "위메프, 역대급 폭염·폭우에 자동차용품 판매량 늘었다",
                    "originallink": "https://www.ajunews.com/view/20230628103039845",
                    "link": "https://www.ajunews.com/view/20230628103039845",
                    "description": "아주<b>경제</b>=김다이 기자 dayi@ajunews.com 위메프 자동차용품 매출 증가율. [사진=위메프] 올여름 역대급 폭염과 비가 예보된 가운데 이를 대비해 차량관리를 하기 위해 자동차용품을 준비하는 많아졌다. 위메프가 최근 한... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                },
                {
                    "title": "현대백화점면세점, 글로벌 개인정보보호 인증 획득",
                    "originallink": "https://www.job-post.co.kr/news/articleView.html?idxno=79739",
                    "link": "https://www.job-post.co.kr/news/articleView.html?idxno=79739",
                    "description": "&apos;CBPR&apos; 인증은 APEC(아시아태평양<b>경제</b>협력체)이 회원국 간 안전한 개인정보 이전을 지원하기 위해 개인정보 보호 관리체계를 잘 갖춘 기업에게 부여하는 국제 인증이다. 현대백화점면세점은 이번 심사에서 개인정보... ",
                    "pubDate": "Wed, 28 Jun 2023 11:24:00 +0900"
                }
            ]
        }
        """
        var tmp = [News(title: "test", link: "test", originallink: "test", description: "test", pubDate: "test")]
        do {
            let dcd = try JSONDecoder().decode(NewsResponseModel.self, from: samples.data(using: .utf8)!)
            tmp = dcd.items
        } catch {
            fatalError("\(error.localizedDescription)")
        }
        return tmp
    }
}
extension News : Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.link == rhs.link
    }
}
