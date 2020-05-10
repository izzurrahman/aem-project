package com.adobe.community.config;

import java.util.Map;

import org.apache.felix.scr.annotations.Activate;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.ConfigurationPolicy;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;

@Service({ISetting.class})
@Component(immediate= true,metatype=true,policy=ConfigurationPolicy.REQUIRE,label="[Izzur] -Setting",description="Desc")
public class ISettingImpl implements ISetting {

	@Property(label="KEY CONFIG",description="Desc 1",value="12AA44>>")
	private static final String KEY_CONFIG="test.key";
	private String keyConfig;
	
	@Activate
	protected void activate(Map<String,Object> properties) {
		keyConfig =(String)properties.get(KEY_CONFIG);
	}

	public String getKeyConfig() {
		return keyConfig;
	}

	public void setKeyConfig(String keyConfig) {
		this.keyConfig = keyConfig;
	}
	
	
}
