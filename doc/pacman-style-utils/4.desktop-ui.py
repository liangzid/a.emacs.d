import re
import requests
import os
import threading
# url1="https://w.wallhaven.cc/full/"
headers={"User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0"}
def do():
    if not os.path.exists("./spider"):
        os.mkdir("./spider/")
    url="https://www.h128.com/pc/anime/0/2/1920x1080/t/"
    url_pre="https://www.h128.com/pc/"
    url_afterfix="/0/2/1920x1080/t/"
    url_houzhui=".html"
    n_list=["anime","TV","Game","animal","Belle","Food","Scenery","Military"]

    for n in n_list:
        if not os.path.exists("./spider/"+n+"/"):
            os.mkdir("./spider/"+n+"/")
        for page in range(100):
            url1=url_pre+n+url_afterfix+str(page+1)+url_houzhui
            print("=="*10)
            print("开始处理{}的第{}张网页".format(n,page+1))
            save_dir="./spider/"+n+"/"+str(page+1)+"_"
            doOnePage(url1,save_dir)
        
def doOnePage(url1,save_dir):
    with open("./index.txt",'w',encoding="utf8") as f:
        f.write(requests.get(url1).content.decode("utf8"))
        print("Write Done.")
        # print(requests.get(url1).content.decode("utf8"))
    with open('./index.txt','r',encoding='utf-8') as f:
        a=f.readlines()
        # print(a)
        urlist=[]
        for ele in a:
            if "<img" in str(ele) and "href" not in str(ele):
                # print(1111)
                # print("find.")
                url=ele.split('"')[1]
                url=url.split("?")[0]
                urlist.append(url)
        for i,url in enumerate(urlist):
            print("-->开始爬取第{}个数据，url是{}".format(i,url))
            if "jpg" in url:
                download(url,savepath=save_dir+str(i)+".jpg")
            elif "png" in url:
                download(url,savepath=save_dir+str(i)+".png")
            else:
                print("跳过！")
                
                

def download(url,savepath):
    try:
        res=requests.get(url,headers=headers)
        if res.status_code == 200:
            with open(savepath,'wb') as f:
                f.write(res.content)
                print("DONE.")
        else:
            print("FAILED.")
    except Exception as e:
        pass
        # print("\n :::error for {}.   Tiaoguo.".format(url))
        # print("----")
        # print(e)
do()


