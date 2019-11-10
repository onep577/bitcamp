package com.rhymes.app.config.tiles;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfiguration {
	
	@Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer configurer = new TilesConfigurer();
        
        //해당 경로에 tiles.xml 파일을 넣음
        configurer.setDefinitions("/WEB-INF/tiles/*/**");
        configurer.setCheckRefresh(true);
        configurer.setDefinitionsFactoryClass(CustomLocaleDefFac.class);
        
        return configurer;
    }

    @Bean
    public TilesViewResolver tilesViewResolver() {
        final TilesViewResolver tilesViewResolver = new TilesViewResolver();
        tilesViewResolver.setViewClass(TilesView.class);
        return tilesViewResolver;
    }
}
