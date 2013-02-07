package controllers;

import play.*;
import play.mvc.*;

import java.util.*;

import models.*;

public class Application extends Controller {

	public static void login() {
		String str = "{\"data\":\"8FCD56545E67FA1CD3BC96893E2AF5EC\",\"msg\":\"SUCCESS\",\"code\":0}";
		renderJSON(str);
	}

	public static void getImages() {
		String str = "{";
		str += "\"data\": [";
		for (int i = 1; i <= 5; i++) {
			str += "{\"URI\":\"/public/images/" + i + ".png\"}";
			if (i != 5) {
				str += ",";
			}
		}
		str += "],";
		str += "\"msg\": \"success\",";
		str += "\"code\": 0}";
		renderJSON(str);
	}

	// 获取系统运行状态
	public static void getSystemState(String domain) {
		System.out.println(domain);
		String str = "{\"data\":[{\"SYS\":\"3G移动办公\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"MSS域\",\"TOTAL\":4,\"FINISH\":2,\"UNFINISH\":2},{\"SYS\":\"IT服务支撑平台（权限管理子系统）\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"信息化基础\",\"TOTAL\":4,\"FINISH\":3,\"UNFINISH\":1},{\"SYS\":\"人力资源管理平台\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"MSS域\",\"TOTAL\":200,\"FINISH\":196,\"UNFINISH\":4},{\"SYS\":\"总部新经营分析系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"DSS域\",\"TOTAL\":46,\"FINISH\":46,\"UNFINISH\":0},{\"SYS\":\"统一客服应用系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"BSS域\",\"TOTAL\":12,\"FINISH\":6,\"UNFINISH\":6},{\"SYS\":\"IT服务支撑平台（综合监控子系统）\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"BSS域\",\"TOTAL\":1,\"FINISH\":0,\"UNFINISH\":1},{\"SYS\":\"ERP项目管理系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"MSS域\",\"TOTAL\":2,\"FINISH\":2,\"UNFINISH\":0},{\"SYS\":\"新一代门户\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"MSS域\",\"TOTAL\":10,\"FINISH\":10,\"UNFINISH\":0},{\"SYS\":\"国际出访数据业务实时计费(DCC-PROXY)系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"BSS域\",\"TOTAL\":16,\"FINISH\":9,\"UNFINISH\":7},{\"SYS\":\"移动用户上网记录查询和分析系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"BSS域\",\"TOTAL\":2,\"FINISH\":1,\"UNFINISH\":1}],\"msg\":\"success\",\"code\":0}";
		if (domain.equals("省分")) {
			str = "{\"data\":[{\"SYS\":\"3G移动办公\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"河北\",\"TOTAL\":4,\"FINISH\":2,\"UNFINISH\":2},{\"SYS\":\"IT服务支撑平台（权限管理子系统）\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"北京\",\"TOTAL\":4,\"FINISH\":3,\"UNFINISH\":1},{\"SYS\":\"人力资源管理平台\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"上海\",\"TOTAL\":200,\"FINISH\":196,\"UNFINISH\":4},{\"SYS\":\"总部新经营分析系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"天津\",\"TOTAL\":46,\"FINISH\":46,\"UNFINISH\":0},{\"SYS\":\"统一客服应用系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"安徽\",\"TOTAL\":12,\"FINISH\":6,\"UNFINISH\":6},{\"SYS\":\"IT服务支撑平台（综合监控子系统）\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"兰州\",\"TOTAL\":1,\"FINISH\":0,\"UNFINISH\":1},{\"SYS\":\"ERP项目管理系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"山西\",\"TOTAL\":2,\"FINISH\":2,\"UNFINISH\":0},{\"SYS\":\"新一代门户\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"黑龙江\",\"TOTAL\":10,\"FINISH\":10,\"UNFINISH\":0},{\"SYS\":\"国际出访数据业务实时计费(DCC-PROXY)系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"四川\",\"TOTAL\":16,\"FINISH\":9,\"UNFINISH\":7},{\"SYS\":\"移动用户上网记录查询和分析系统\",\"PROVINCE\":\"总部\",\"DOMAIN\":\"湖北\",\"TOTAL\":2,\"FINISH\":1,\"UNFINISH\":1}],\"msg\":\"success\",\"code\":0}";
		}
		renderJSON(str);
	}

	// 代办工单
	public static void getWarning() {
		String str = "{\"data\":[{\"TITLE\":\"重置子公司oa密码yuanxz2\",\"ORDERDATE\":1355328000000,\"USERNAME\":\"zhulp\",\"RN\":1},{\"TITLE\":\"重置子公司门户密码\\n\",\"ORDERDATE\":1355414400000,\"USERNAME\":\"zhulp\",\"RN\":2}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 本月集团频发告警系统top10
	public static void getCentralSystemWarning() {
		String str = "{\"data\":[{\"POSITION\":1,\"SYS\":\"人力资源管理平台\",\"TOTAL\":1474},{\"POSITION\":2,\"SYS\":\"总部门户及办公应用\",\"TOTAL\":852},{\"POSITION\":3,\"SYS\":\"ERP财务报账系统\",\"TOTAL\":272},{\"POSITION\":4,\"SYS\":\"子公司门户\",\"TOTAL\":241},{\"POSITION\":5,\"SYS\":\"ERP资金管理系统\",\"TOTAL\":182},{\"POSITION\":6,\"SYS\":\"总部合作伙伴关系管理系统（集中PRM）\",\"TOTAL\":170},{\"POSITION\":7,\"SYS\":\"国际出访数据业务实时计费(DCC-PROXY)系统\",\"TOTAL\":131},{\"POSITION\":8,\"SYS\":\"ERP采购管理系统\",\"TOTAL\":104},{\"POSITION\":9,\"SYS\":\"ERP项目管理系统\",\"TOTAL\":93},{\"POSITION\":10,\"SYS\":\"集中渠道管理系统\",\"TOTAL\":69}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 本月集团频发告警设备top10
	public static void getCentralEquipmentWarning() {
		String str = "{\"data\":[{\"POSITION\":1,\"DEVICE\":\"rsehra05\",\"SYS\":\"人力资源管理平台\",\"CROOM\":\"亦庄EDC-D机房\",\"TOTAL\":175},{\"POSITION\":2,\"DEVICE\":\"dbfile1\",\"SYS\":\"总部门户及办公应用\",\"CROOM\":\"集团EDC-S机房\",\"TOTAL\":93},{\"POSITION\":3,\"DEVICE\":\"hu010e13\",\"SYS\":\"ERP人力系统\",\"CROOM\":\"亦庄EDC-D机房\",\"TOTAL\":30},{\"POSITION\":4,\"DEVICE\":\"备份主机1\",\"SYS\":\"新一代门户\",\"CROOM\":\"集团EDC机房\",\"TOTAL\":12},{\"POSITION\":5,\"DEVICE\":\"rserpd90\",\"SYS\":\"ERP营销资源管理系统\",\"CROOM\":\"亦庄EDC-D机房\",\"TOTAL\":10},{\"POSITION\":6,\"DEVICE\":\"rsoa2\",\"SYS\":\"集团OA\",\"CROOM\":\"集团EDC-S机房\",\"TOTAL\":10},{\"POSITION\":7,\"DEVICE\":\"ECM_APP1_01\",\"SYS\":\"合同管理系统\",\"CROOM\":\"亦庄EDC-D机房\",\"TOTAL\":7},{\"POSITION\":8,\"DEVICE\":\"备份主机2\",\"SYS\":\"新一代门户\",\"CROOM\":\"集团EDC机房\",\"TOTAL\":5},{\"POSITION\":9,\"DEVICE\":\"unicom_ZGSwas02\",\"SYS\":\"子公司OA\",\"CROOM\":\"集团EDC-S机房\",\"TOTAL\":5},{\"POSITION\":10,\"DEVICE\":\"CUJF-WEBA\",\"SYS\":\"总部经营分析系统\",\"CROOM\":\"京门230机房\",\"TOTAL\":5}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 本月集团频发TYPEtop10
	public static void getCentralCategoryWarning() {
		String str = "{\"data\":[{\"POSITION\":1,\"TYPE\":\"日志文件过滤异常\",\"TOTAL\":1754},{\"POSITION\":2,\"TYPE\":\"文件长时间无进展\",\"TOTAL\":619},{\"POSITION\":3,\"TYPE\":\"进程数量异常\",\"TOTAL\":389},{\"POSITION\":4,\"TYPE\":\"连接是否成功\",\"TOTAL\":386},{\"POSITION\":5,\"TYPE\":\"cpu平均使用率太高\",\"TOTAL\":358},{\"POSITION\":6,\"TYPE\":\"HTTP连接失败\",\"TOTAL\":237},{\"POSITION\":7,\"TYPE\":\"主机连接断开\",\"TOTAL\":74},{\"POSITION\":8,\"TYPE\":\"数量过多异常\",\"TOTAL\":32},{\"POSITION\":9,\"TYPE\":\"数据库连接不上\",\"TOTAL\":21},{\"POSITION\":10,\"TYPE\":\"Windows日志文件过滤异常\",\"TOTAL\":14}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 本月省分频发TYPEtop10
	public static void getProvinceCategoryWarning() {
		String str = "{\"data\":[{\"POSITION\":1,\"TYPE\":\"端口状态\",\"TOTAL\":90},{\"POSITION\":2,\"TYPE\":\"客户资料查询交易成功率异常\",\"TOTAL\":72},{\"POSITION\":3,\"TYPE\":\"接口描述身份验证交易成功率异常\",\"TOTAL\":61},{\"POSITION\":4,\"TYPE\":\"查询类业务成功率异常\",\"TOTAL\":60},{\"POSITION\":5,\"TYPE\":\"用户属性快速查询交易成功率异常\",\"TOTAL\":60},{\"POSITION\":6,\"TYPE\":\"预付费用户缴费\",\"TOTAL\":48},{\"POSITION\":7,\"TYPE\":\"业务受理平均时间超标\",\"TOTAL\":47},{\"POSITION\":8,\"TYPE\":\"受理类业务成功率异常\",\"TOTAL\":44},{\"POSITION\":9,\"TYPE\":\"3G通话详单查询交易成功率异常\",\"TOTAL\":40},{\"POSITION\":10,\"TYPE\":\"资源验证及号码预占\",\"TOTAL\":35}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 本月集团频发告警机房top10
	public static void getCentralRoomWarning() {
		String str = "{\"data\":[{\"POSITION\":1,\"CROOM\":\"亦庄EDC-D机房\",\"TOTAL\":2209},{\"POSITION\":2,\"CROOM\":\"京门230机房\",\"TOTAL\":962},{\"POSITION\":3,\"CROOM\":\"集团EDC机房\",\"TOTAL\":261},{\"POSITION\":4,\"CROOM\":\"亦庄EDC-C机房\",\"TOTAL\":174},{\"POSITION\":5,\"CROOM\":\"集团EDC-S机房\",\"TOTAL\":173},{\"POSITION\":6,\"CROOM\":\"上地硅谷亮城3B205机房\",\"TOTAL\":72},{\"POSITION\":7,\"CROOM\":\"上地硅谷亮城机房\",\"TOTAL\":32},{\"POSITION\":8,\"CROOM\":\"京门B201机房\",\"TOTAL\":17},{\"POSITION\":9,\"CROOM\":\"小汤山1号楼B1层\",\"TOTAL\":6},{\"POSITION\":10,\"CROOM\":\"上地硅谷亮城3B栋4层\",\"TOTAL\":4}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 上月各省分告警统计POSITION
	public static void allprovinces() {
		String str = "{\"data\":[{\"POSITION\":1,\"PROVINCE\":\"海南\",\"上月TOTAL\":6,\"上上月TOTAL\":1,\"环比\":\"500↑\"},{\"POSITION\":2,\"PROVINCE\":\"云南\",\"上月TOTAL\":8289,\"上上月TOTAL\":2598,\"环比\":\"219.1↑\"},{\"POSITION\":3,\"PROVINCE\":\"江西\",\"上月TOTAL\":20,\"上上月TOTAL\":7,\"环比\":\"185.7↑\"},{\"POSITION\":4,\"PROVINCE\":\"河南\",\"上月TOTAL\":88,\"上上月TOTAL\":46,\"环比\":\"91.3↑\"},{\"POSITION\":5,\"PROVINCE\":\"北京\",\"上月TOTAL\":94,\"上上月TOTAL\":52,\"环比\":\"80.8↑\"},{\"POSITION\":6,\"PROVINCE\":\"青海\",\"上月TOTAL\":7,\"上上月TOTAL\":4,\"环比\":\"75↑\"},{\"POSITION\":7,\"PROVINCE\":\"内蒙古\",\"上月TOTAL\":82,\"上上月TOTAL\":60,\"环比\":\"36.7↑\"},{\"POSITION\":8,\"PROVINCE\":\"四川\",\"上月TOTAL\":40,\"上上月TOTAL\":35,\"环比\":\"14.3↑\"},{\"POSITION\":9,\"PROVINCE\":\"广东\",\"上月TOTAL\":195,\"上上月TOTAL\":177,\"环比\":\"10.2↑\"},{\"POSITION\":10,\"PROVINCE\":\"湖北\",\"上月TOTAL\":33,\"上上月TOTAL\":31,\"环比\":\"6.5↑\"}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 重大告警列表
	public static void getWarningList() {
		String str = "{\"data\":[{\"EVENTTYP\":\"主机断开连接\",\"ELEVEL\":\"轻微\",\"AREA\":\"总部\",\"DOMAIN\":\"MSS域\",\"RANGE\":\"应用\",\"SYS\":\"ERP资金管理系统\",\"CONTENT\":\"10.0.202.43:9081 10.0.202.43 的端口:9081异常.\",\"TIME\":1354533346000,\"MPERSON\":\"刘学军\"},{\"EVENTTYP\":\"CPU用户平均使用率过高\",\"ELEVEL\":\"轻微\",\"AREA\":\"总部\",\"DOMAIN\":\"MSS域\",\"RANGE\":\"应用\",\"SYS\":\"ERP资金管理系统\",\"CONTENT\":\"10.0.202.45:9081 10.0.202.45 的端口:9081异常.\",\"TIME\":1354533137000,\"MPERSON\":\"刘学军\"}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 重大告警催办列表
	public static void getWarningUser() {
		String str = "{\"data\":[{\"Name\":\"张三\",\"Phone\":\"13988762234\"},{\"Name\":\"张三\",\"Phone\":\"13988762234\"}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}

	// 重集团各域告警趋势分析（月）
	public static void getTrend() {
		String str = "{\"data\":[{\"TIMEORDER\":1,\"CM\":20,\"LM\":36,\"LCM\":33},{\"TIMEORDER\":2,\"CM\":24,\"LM\":49,\"LCM\":15},{\"TIMEORDER\":3,\"CM\":35,\"LM\":17,\"LCM\":6},{\"TIMEORDER\":4,\"CM\":28,\"LM\":15,\"LCM\":2},{\"TIMEORDER\":5,\"CM\":27,\"LM\":28,\"LCM\":17},{\"TIMEORDER\":6,\"CM\":57,\"LM\":30,\"LCM\":20},{\"TIMEORDER\":7,\"CM\":56,\"LM\":50,\"LCM\":8},{\"TIMEORDER\":8,\"CM\":52,\"LM\":45,\"LCM\":18},{\"TIMEORDER\":9,\"CM\":28,\"LM\":43,\"LCM\":17},{\"TIMEORDER\":10,\"CM\":49,\"LM\":17,\"LCM\":3},{\"TIMEORDER\":11,\"CM\":28,\"LM\":9,\"LCM\":3},{\"TIMEORDER\":12,\"CM\":25,\"LM\":28,\"LCM\":5},{\"TIMEORDER\":13,\"CM\":57,\"LM\":39,\"LCM\":4},{\"TIMEORDER\":14,\"CM\":30,\"LM\":49,\"LCM\":15},{\"TIMEORDER\":15,\"CM\":16,\"LM\":51,\"LCM\":4},{\"TIMEORDER\":16,\"CM\":8,\"LM\":30,\"LCM\":17},{\"TIMEORDER\":17,\"CM\":23,\"LM\":15,\"LCM\":2},{\"TIMEORDER\":18,\"CM\":25,\"LM\":35,\"LCM\":4},{\"TIMEORDER\":19,\"CM\":41,\"LM\":33,\"LCM\":5},{\"TIMEORDER\":20,\"CM\":50,\"LM\":36,\"LCM\":8},{\"TIMEORDER\":21,\"CM\":27,\"LM\":63,\"LCM\":5},{\"TIMEORDER\":22,\"CM\":0,\"LM\":42,\"LCM\":14},{\"TIMEORDER\":23,\"CM\":0,\"LM\":43,\"LCM\":16},{\"TIMEORDER\":24,\"CM\":0,\"LM\":19,\"LCM\":13},{\"TIMEORDER\":25,\"CM\":0,\"LM\":14,\"LCM\":10},{\"TIMEORDER\":26,\"CM\":0,\"LM\":56,\"LCM\":42},{\"TIMEORDER\":27,\"CM\":0,\"LM\":71,\"LCM\":19},{\"TIMEORDER\":28,\"CM\":0,\"LM\":84,\"LCM\":28},{\"TIMEORDER\":29,\"CM\":0,\"LM\":59,\"LCM\":29},{\"TIMEORDER\":30,\"CM\":0,\"LM\":77,\"LCM\":12},{\"TIMEORDER\":31,\"CM\":0,\"LM\":0,\"LCM\":6}],\"msg\":\"success\",\"code\":0}";
		renderJSON(str);
	}
}