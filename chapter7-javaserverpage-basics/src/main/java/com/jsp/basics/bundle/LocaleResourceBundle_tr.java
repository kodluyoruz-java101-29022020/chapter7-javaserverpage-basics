package com.jsp.basics.bundle;

import java.util.ListResourceBundle;

public class LocaleResourceBundle_tr extends ListResourceBundle {

	@Override
	public Object[][] getContents() {
		
		return new Object[][] {
			{ "page.message.title", "Harika Oyuncak Mağazası" },
			{ "page.message.footer", "İletişim Bölümü" },
			{ "page.message.warning", "Lütfen ürünlerinizi sepete ekleyiniz!" },
			{ "page.message.success", "Siparişiniz başarıyla oluşturulmuştur :)" },
			{ "page.message.fail", "Sipariş oluşturulurken sorun oluştu. Lütfen çağrı merkezine ulaşınız." }
		};
	}
}
