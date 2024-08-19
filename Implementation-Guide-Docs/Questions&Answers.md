# Part 1

1. <ins> Why do we need a binary file? Can we run the application without the binary file? naming convention for binary file.</ins>

A binary file is crucial because it contains the compiled code that the system can execute directly. In languages like Go, the source code is not directly executable by the operating system.
Instead, it needs to be compiled into a binary, which translates the human-readable code into machine code that the CPU can run.

Without a binary file, you cannot run the application, as the system cannot interpret the source code directly. The binary file serves as the executable form of your application.

Naming Convention: Binary files are usually named after the application or a descriptive term, often matching the main file or function they execute (e.g., myapp, server).
On Unix-like systems, there is no extension, but on Windows, a .exe extension is common. It's important to use clear, consistent names to avoid confusion, especially in multi-stage builds.

2. <ins>How is Docker Desktop helping ?</ins>

Docker Desktop is essential for developing and testing containerized applications locally. It allows you to build and run Docker images on your machine,
manage containers through a user-friendly interface, and push images to Docker Hub.
Additionally, it integrates with Kubernetes, enabling you to test deployments locally before moving to a cloud environment like EKS. This streamlines the entire containerization process, from development to deployment.

In my case, Docker Desktop also acts as the systemd equivalent for WSL. It manages the Docker daemon, allowing you to run Docker commands and services within WSL without needing systemd,
which isn't available by default on WSL. This enables seamless container management and orchestration in a WSL environment.

3.<ins> What is a distroless image? How does it help? how do you choose a distroless image?</ins>

A distroless image is a minimal Docker image containing only the essential components needed to run your application—without an entire operating system, unnecessary tools, or libraries.

𝗦𝗲𝗰𝘂𝗿𝗶𝘁𝘆: By eliminating package managers and shells, distroless images reduce the attack surface, making the container more secure.

𝗘𝗳𝗳𝗶𝗰𝗶𝗲𝗻𝗰𝘆: It only contains the required runtime environment, making it lighter and faster. In the case of 'go', the application doesn't require a runtime environment like for java and pythons apps. 

𝗖𝗼𝘀𝘁 𝗦𝗮𝘃𝗶𝗻𝗴𝘀: Smaller images reduce storage and data transfer costs, especially in cloud environments.

𝗙𝗮𝘀𝘁𝗲𝗿 𝗣𝗶𝗽𝗲𝗹𝗶𝗻𝗲𝘀: Optimized images lead to quicker build times and faster deployments, streamlining your CI/CD process.

4.<ins> What are systems like 'init' , 'upstart' or 'systeminit' ?</ins>

-------------------------------------------------------------------
