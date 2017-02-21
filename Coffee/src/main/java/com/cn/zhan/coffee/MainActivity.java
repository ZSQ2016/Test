package com.cn.zhan.coffee;


import android.annotation.TargetApi;
import android.graphics.Color;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;

import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private Toolbar mToolbar;
    private RecyclerView recyclerView;
    private RecyclerView.LayoutManager layoutManager;
    private RecyclerAdapter recyclerAdapter;
    private int[] intList = {R.drawable.image_1, R.drawable.image_2, R.drawable.image_3, R.drawable.image_4, R.drawable.image_5,
            R.drawable.image_6, R.drawable.image_7, R.drawable.image_8, R.drawable.image_9, R.drawable.image_10, R.drawable.image_11,
            R.drawable.image_12, R.drawable.image_13, R.drawable.image_14, R.drawable.image_15, R.drawable.image_16,
            R.drawable.image_17, R.drawable.image_18, R.drawable.image_19, R.drawable.image_20};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

       initViews();
        //interviews();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.main,menu);
        return true;
    }
    private void initViews() {
        mToolbar = (Toolbar) this.findViewById(R.id.toolbar);
        mToolbar.setLogo(R.drawable.image_1);

getSupportActionBar().setLogo(R.drawable.image_2);

        //先在styles.xml中设置NoActionBar再setSupportActionBar用Toolbar取代ActionBar
      //  setSupportActionBar(mToolbar);


        //设置状态栏的item的点击事件,或者使用方法Activity的onOptionsItemSelected
        mToolbar.setOnMenuItemClickListener(new Toolbar.OnMenuItemClickListener() {

            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case R.id.item3:
                        Toast.makeText(MainActivity.this,"333", Toast.LENGTH_SHORT).show();
                        break;
                    case R.id.item4:
                        Toast.makeText(MainActivity.this,"444", Toast.LENGTH_SHORT).show();
                        break;
                    default:
                        break;
                }
                return true;
            }
        });



    }

    private void interviews() {

        recyclerView = (RecyclerView) findViewById(R.id.recyclerView);
        //创建布局管理器默认为纵向
        layoutManager =new LinearLayoutManager(MainActivity.this);
        //加载布局管理器
        recyclerView.setLayoutManager(layoutManager);
        //创建Adapter对象
        recyclerAdapter = new RecyclerAdapter(intList);
        //调用自定义方法传递接口对象并写接口实现方法(因为接口对象不为空所以可以接受点击，在点击方法中调用自定义接口)
        //真正的监听点击事件在我写在Adapter中
        //点击时按下状态通过Background设置
        recyclerAdapter.setItemClick(new RecyclerAdapter.ItemClick() {
            @Override
            public void ItemOnClick(View view, int position) {
                Toast.makeText(MainActivity.this, "点击第" + (position+1)+"张", Toast.LENGTH_SHORT).show();
            }

            @Override
            public void ItemOnLongClick(View view, int position) {
                Toast.makeText(MainActivity.this, "移动第" + (position+1)+"张", Toast.LENGTH_SHORT).show();
            }
        });

        //加载Adapter
        recyclerView.setAdapter(recyclerAdapter);
    }

    //Activity获得焦点和失去焦点之后调用
    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if(hasFocus&& Build.VERSION.SDK_INT>=19)
        {
            View decorView=getWindow().getDecorView();
            decorView.setSystemUiVisibility(
                    View.
                            //让应用主体内容占据系统导航栏的空间
                            SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                            //两个要一起使用，让应用主体内容占据系统状态栏的空间
                            |View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                            |View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                            //隐藏导航栏
                            |View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                    //全屏即隐藏状态栏
                    //   |View.SYSTEM_UI_FLAG_FULLSCREEN
                    // |View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
            );
            //导航栏透明色
            getWindow().setNavigationBarColor(Color.TRANSPARENT);
            //状态栏透明色
            getWindow().setStatusBarColor(Color.TRANSPARENT);

        }
    }
}
