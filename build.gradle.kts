group = "CrossFile"

plugins {
    id("org.jetbrains.kotlin.jvm") version "1.7.10"
    `java-library`
}

sourceSets {
    main {
        java {
            setSrcDirs(listOf("Sources/CrossFileKotlin"))
        }
    }

    test {
        java {
            setSrcDirs(listOf("Tests/CrossFileKotlinTests"))
        }
    }
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit5")
}

tasks.named<Test>("test") {
    useJUnitPlatform()
}
