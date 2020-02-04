package com.portfordev.pro.common;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundAdvice {
	@Around("execution(* com.portfordev.pro..*Impl.is*(..))")
	public Object aroundLog(ProceedingJoinPoint proceeding) throws Throwable {

		StopWatch sw = new StopWatch();
		sw.start();
		
		Object result = proceeding.proceed();
		
		sw.stop();
		Signature sig = proceeding.getSignature();
		System.out.printf("[Around Advice의 after] : %s.%s(%s) \n", 
						  proceeding.getTarget().getClass().getSimpleName(),
						  sig.getName(),
						  Arrays.toString(proceeding.getArgs()));
		
		System.out.println("[Around Advice의 after]: "
				 		  + proceeding.getSignature().getName() + "() 메소드 수행 시간 : "
				 		  + sw.getTotalTimeMillis() + "(ms)초");
		
		System.out.println("[Around Advice의 after] : "
				          + proceeding.getTarget().getClass().getName());
		
		System.out.println("proceeding.proceed() 실행 후 반환값 : " + result);
		System.out.println("=============================================");
		
		return result;
	}
}
