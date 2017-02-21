package com.cn.zhan.coffee;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

/**
 * Created by Administrator on 2016-8-22 0022.
 */
public class RecyclerAdapter extends RecyclerView.Adapter<RecyclerAdapter.RecyclerHolder> {

    private View view;
    private int[] integerList;

    //构造方法获取数据
    public RecyclerAdapter(int[] integerList) {
      this.integerList=integerList;
    }

    //定义一个接口，方法中为点击和长按时执行的事件在调用的主类中实现
    public interface ItemClick {
        void ItemOnClick(View view, int position);

        void ItemOnLongClick(View view, int position);
    }

    private ItemClick itemClick;

    //定义使用方法，供调用的主类中来加载该方法(加载监听事件),传递接口监听类对象过来
    public void setItemClick(ItemClick itemClick) {
        this.itemClick = itemClick;
    }

    //创建View被LayoutManager所调用
    //创建ViewHolder，获取对应View的控件
    public RecyclerHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        view = LayoutInflater.from(parent.getContext()).inflate(R.layout.recycler_item, parent, false);
        RecyclerHolder recyclerHolder = new RecyclerHolder(view);
        return recyclerHolder;
    }

    //将View数据绑定到View上
    public void onBindViewHolder(final RecyclerHolder holder, final int position) {
        holder.imageView.setBackgroundResource(integerList[position]);
        //如果实现了自定义的监听接口(即如果传递了接口类对象过来)，则可以调用系统给的监听事件
        if (itemClick != null) {
            //真正的点击监听事件方法
            holder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    //触发点击事件后调用自定义的方法，因为传递了接口对象过来所以肯定实现了接口中的方法了
                    itemClick.ItemOnClick(holder.itemView, position);
                }
            });
            //真正的长按监听事件方法
            holder.itemView.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    itemClick.ItemOnLongClick(holder.itemView, position);
                    return false;
                }
            });
        }


    }

    @Override
    public int getItemCount() {
        return integerList.length;
    }



    //创建ViewHolder持有对应的View的控件
    class RecyclerHolder extends RecyclerView.ViewHolder {
        ImageView imageView;

        public RecyclerHolder(View itemView) {
            super(itemView);
            imageView = (ImageView) itemView.findViewById(R.id.imageViewItem);

        }
    }



}
