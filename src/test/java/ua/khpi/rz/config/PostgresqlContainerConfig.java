package ua.khpi.rz.config;

import org.testcontainers.containers.PostgreSQLContainer;

public class PostgresqlContainerConfig extends PostgreSQLContainer<PostgresqlContainerConfig> {
    private static final String IMAGE_VERSION = "postgres:11.1";
    private static PostgresqlContainerConfig container;

    private PostgresqlContainerConfig() {
        super(IMAGE_VERSION);
    }

    public static PostgresqlContainerConfig getInstance() {
        if (container == null) {
            container = new PostgresqlContainerConfig();
        }
        return container;
    }

    @Override
    public void start() {
        super.withInitScript("data.sql");
        super.start();
        System.setProperty("DB_URL", container.getJdbcUrl());
        System.setProperty("DB_USERNAME", container.getUsername());
        System.setProperty("DB_PASSWORD", container.getPassword());
    }

    @Override
    public void stop() {
    }
}
