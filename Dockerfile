cat > Dockerfile << 'EOF'
# imagem de runtime (leve). Use Java 21; roda JARs compilados com 17+ sem problemas.
FROM eclipse-temurin:21-jre

# diretório de trabalho
WORKDIR /app

# copie o JAR gerado (qualquer nome *.jar em target/)
COPY target/*.jar app.jar

# porta padrão do Spring Boot
EXPOSE 8080

# healthcheck opcional (só funciona se sua app tiver /actuator/health)
# HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD curl -fsS http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java","-jar","/app/app.jar"]
EOF
