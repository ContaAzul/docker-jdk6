6:
	sed "s/__JAVA_VERSION__/6/g" Dockerfile.template > Dockerfile
	docker build -t caninjas/jdk6 .
7:
	sed "s/__JAVA_VERSION__/7/g" Dockerfile.template > Dockerfile
	docker build -t caninjas/jdk7 .
8:
	sed "s/__JAVA_VERSION__/8/g" Dockerfile.template > Dockerfile
	docker build -t caninjas/jdk8 .
