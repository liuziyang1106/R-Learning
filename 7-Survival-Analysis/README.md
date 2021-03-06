# 生存分析

在生物和医药领域，经常遇到生存数据的分析。在队列研究中，随访从研究起点直到研究终点，或直到出现研究结局为止。
对于结局事件在研究结束前发生的研究对象，总的随访时间是知道的。
对于随访结束没有发生结局事件的对象，最后的状态成为“删失”
有些患者失去了联系，或者他们的生存时间长于研究期，这是我们无法获得这部分患者真正的生存时间，称为右删失
生存时间小于某一段时间，成为左删失

生存分析是研究生存时间和结局事件的分布及其影响因素的统计方法。
在生存分析中，
生存函数S(t)用于刻画某个时刻t的研究对象存活的概率，
风险函数 hazard function h(t) 用于度量 在某个时刻t还存活的个体在极短时间死亡的风险。
如果记寿命分布的密度为f(t), 则h(t) = f(t) / S(t)

