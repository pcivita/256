public class VideoClass {
    
    Video@ video;
    GMesh mesh;
    GMesh meshes[400];
    1 => int rotate;
    0 => float video_aspect;
    [ 
            new PlaneGeometry,
            new CubeGeometry,
            new SuzanneGeometry,
    ] @=> Geometry geometries[];
     FlatMaterial video_mat;

    fun void init(string videoFile, int create) {
        
        Video video(me.dir() + videoFile);
        video.gain(0);
        video @=> this.video;
        video.texture() @=> Texture video_texture;
        (video.width() $ float) / video.height() => video_aspect;

        video_mat.scale(@(1, -1));
       
        
        if (create) {
        GMesh video_mesh(geometries[0], video_mat) --> GG.scene();
        video_mesh @=> mesh;
        } else {
            GMesh video_mesh(geometries[0], video_mat);
            video_mesh @=> mesh;
        }
        
        mesh.scaX(5 * video_aspect);
        mesh.scaY(5);
        mesh.scaZ(5);

        video_mat.colorMap(video_texture);
        1 => video.loop;

        

    }


    fun void initCube(string videoFile, int create, int geo) {
        
        Video video(me.dir() + videoFile);
        video.gain(0);
        video @=> this.video;
        video.texture() @=> Texture video_texture;
        (video.width() $ float) / video.height() => video_aspect;

        video_mat.scale(@(1, -1));
       
        
        if (create) {
        GMesh video_mesh(geometries[geo], video_mat) --> GG.scene();
        video_mesh @=> mesh;
        } else {
            GMesh video_mesh(geometries[geo], video_mat);
            video_mesh @=> mesh;
        }
        
        mesh.scaX(5 * video_aspect);
        mesh.scaY(5);
        mesh.scaZ(5);

        video_mat.colorMap(video_texture);
        1 => video.loop;

        

    }

    fun void setLoop(int loop) {
        loop => this.video.loop;
    }

    fun void setPos(int x, int y, int z) {
        mesh.posX(x);
        mesh.posY(y);
        mesh.posZ(z);
    }

    fun void multiply(int geo) {
        GMesh video_meshes(geometries[geo], video_mat)[400] @=> meshes;
        0 => int index;

        -10 => int x_start;
        9 => int x_end;
        10 => int y_start;
        -9 => int y_end;    

        x_start => int x;
        y_start => int y;


        for (auto mesh : meshes) {
           
            mesh --> GG.scene();
    
            mesh.posX(x * 3);
            mesh.posY(y * 4);

            mesh.scaX(2 * video_aspect);
            mesh.scaY(2);
            mesh.scaZ(2);
            
            x + 1 => x;
            if (x > x_end) {
            x_start => x;
            y - 1 => y;

            }
        }
    }
    fun void removeMult() {
        video.rate(0);
        for (auto mesh : meshes) {
           
            mesh.detach();
        }
    }
    // fun void removeVideo()

    fun void rotateCube() {

        0.0 => float angle;
        1 => rotate;
    while (rotate) {
        GG.nextFrame() => now;
        GG.dt() => float dt;    // Get the time elapsed since last frame
        angle + (dt * 0.5) => angle;      // Increase angle slowly: 0.5 radians/sec
        mesh.rotY(angle);       // Set mesh rotation around Y axis
    }
    }

    fun void setHall(int depth) {
        mesh.scaX(10);
        mesh.scaZ(depth);
    }

    fun void stopRotate() {
        0 => rotate;
    }
}