package io.gwola.boot.config.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author sunyu1984
 */
@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<String, String> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, String> redisTemplate = new RedisTemplate<String, String>();
        redisTemplate.setConnectionFactory(factory);

        //key序列化方式;（不然会出现乱码;）,但是如果方法上有Long等非String类型的话，会报类型转换错误；
        //所以在没有自己定义key生成策略的时候，以下这个代码建议不要这么写，可以不配置或者自己实现ObjectRedisSerializer
        //或者JdkSerializationRedisSerializer序列化方式;
        //RedisSerializer<String> redisSerializer = new StringRedisSerializer();//Long类型不可以会出现异常信息;
        //redisTemplate.setKeySerializer(redisSerializer);
        //redisTemplate.setHashKeySerializer(redisSerializer);

        return redisTemplate;
    }

    @Bean(name= "spring.jedis")
    @Autowired
    public JedisPool jedisPool(@Qualifier("spring.jedis.pool") JedisPoolConfig config,
                               @Value("${spring.redis.host}")String host,
                               @Value("${spring.redis.port}")int port) {
        return new JedisPool(config, host, port);
    }

    @Bean(name= "spring.jedis.pool")
    public JedisPoolConfig jedisPoolConfig (@Value("${spring.redis.jedis.pool.max-active}")int maxTotal,
                                            @Value("${spring.redis.jedis.pool.max-idle}")int maxIdle,
                                            @Value("${spring.redis.jedis.pool.max-wait}")int maxWaitMillis){
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(maxTotal);
        config.setMaxIdle(maxIdle);
        config.setMaxWaitMillis(maxWaitMillis);
        return config;
    }


}