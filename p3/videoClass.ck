public class VideoClass {
    
    Video@ video;
    GMesh mesh;

    fun void init(string videoFile) {
        
        Video video(me.dir() + videoFile);
        video @=> this.video;
        video.gain(0);
        video.texture() @=> Texture video_texture;
        (video.width() $ float) / video.height() => float video_aspect;
        FlatMaterial video_mat;
        video_mat.scale(@(1, -1));
       
        [ 
            new PlaneGeometry,
            new SuzanneGeometry
        ] @=> Geometry geometries[];

        GMesh video_mesh(geometries[0], video_mat) --> GG.scene();
        video_mesh @=> mesh;
        mesh.scaX(3 * video_aspect);
        mesh.scaY(3);
        mesh.scaZ(3);

        video_mat.colorMap(video_texture);
        1 => video.loop;

        // GMesh video_meshes(geometries[0], video_mat)[100];
        // for (auto mesh : video_meshes) {
        //     Math.random2(0, 10) => int randomX;
        //     mesh --> GG.scene();
        //     mesh.posX(randomX);

        // }

    }

    fun void setLoop(int loop) {
        loop => this.video.loop;
    }

    fun void setPos(int x, int y, int z) {
        mesh.posX(x);
        mesh.posY(y);
        mesh.posZ(z);
    }

    // fun void removeVideo()
}