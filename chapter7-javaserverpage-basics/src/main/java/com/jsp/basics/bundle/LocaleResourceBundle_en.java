package com.jsp.basics.bundle;

import java.util.ListResourceBundle;

public class LocaleResourceBundle_en extends ListResourceBundle {

	@Override
	public Object[][] getContents() {
		
		return new Object[][] {
			{ "page.message.title", "Perfect Toy Shop" },
			{ "page.message.footer", "Communication Section" },
			{ "page.message.warning", "Please add your products to shooping chart!" },
			{ "page.message.success", "Your order is completed successfully!" },
			{ "page.message.fail", "Order creation is failed, please contact with call center!" }
		};
	}
}
