package com.metaus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class MetausApplication {

	public static void main(String[] args) {
		SpringApplication.run(MetausApplication.class, args);
	}

}
