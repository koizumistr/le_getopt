# le_getopt
## Simple English
getopt-like class in Liberty Eiffel

## 日本語での説明
getoptっぽいことをするLiberty Eiffel[^othereiffel]のクラス(le_getopt.e)です。
説明は面倒になったので、サンプルのle_getopt_test.eを見てください。

というのもあんまりですからもうちょっと説明。
より正確にはgetopt_longっぽいことをするためのクラスです。getopt_longについては

    man 3 getopt_long

でどうぞ。以下の動作例にもあるように、getoptを呼び出すとargument(i)は破壊されますのでご注意を（参考にしたCライブラリのgetopt_long/getoptもそういう動作だと思いますが、、、）

### 動作例
le_getopt_test.eをコンパイルして、コマンドライン引数として以下のようなものを与えると

    ./a.out -b coo -f gooo hijkl

こんな感じの結果になります。

    == options ==
    b : coo
    f : 

    == arguments ==
    gooo
    hijkl

[^othereiffel]: Liberty Eiffelでしか動作を確かめていません。というか、他のEiffel（と言っても本家くらいしか知りませんが）では、もっともっと本気のライブラリがあるようですので、こんなの不必要でしょう。Liberty EiffelでもgetoptのCライブラリのラッパーがあるので、そちらを使うのが正当なのかもしれませんが、引数をまるっと渡す方法が分からず、私には使えませんでした(T_T)
