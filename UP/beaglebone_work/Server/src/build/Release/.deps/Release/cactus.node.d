cmd_Release/cactus.node := ln -f "Release/obj.target/cactus.node" "Release/cactus.node" 2>/dev/null || (rm -rf "Release/cactus.node" && cp -af "Release/obj.target/cactus.node" "Release/cactus.node")
