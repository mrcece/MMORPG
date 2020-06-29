# 一.表格说明

- Buff是buff配置表
- 一行一个buff(buffID+等级)

# 二.表格字段说明

- 字段名加*表示有详细说明

| 字段名                   | 字段含义                                                   |
| :----------------------- | :--------------------------------------------------------- |
|ID|唯一id|
|BuffID|buffID|
|BuffLevel|buff等级|
|IsShowIcon|是否显示icon|
|Icon|icon名|
|Name|buff名称|
|Effect*|buff效果|
|Type|buff类型,0:增益,1:减益|
|TotalTime*|buff时长,单位ms|
|Interval*|buff间隔触发时间,单位ms,0表示不触发|
|Overlap*|buff叠加上限次数|
|StopCondition*|buff终止条件|
|EffectID1*|buff影响的固定属性id|
|EffectValue1*|buff影响的固定属性值|
|IsPercentOnMax1*|buff影响的固定属性,是否基于最大值百分比|
|EffectID2|同1|
|EffectValue2|同1|
|IsPercentOnMax2|同1|
|EffectID3|同1|
|EffectValue3|同1|
|IsPercentOnMax3|同1|
|EffectID4|同1|
|EffectValue4|同1|
|IsPercentOnMax4|同1|
|SpeedPara|buff影响的属性:速度百分比|
|AbsorbPara1|buff影响的属性:抵挡伤害值|
|AbsorbPara2|buff影响的属性:抵挡伤害转为治疗百分比|
|ReboundPara|buff影响的属性:反弹百分比|
|ShieldPara|buff影响的属性:护盾值|
|VampPara|buff影响的属性:吸血百分比|
|ParryPara*|buff影响的属性:格挡减伤|
|PreBuffIDs*|前置buff|
|ImmuneBuffIDs*|免疫buff|
|Scale*|模型缩放|
|StartScaleTime*|开始模型缩放时间|
|EndScaleTime*|结束模型缩放时间|
|ReplaceMaterial|替换材质|
|MaterialParameter|材质参数|
|Fx|特效|
|Sound|音效|
|AttackerFx|命中特效|
|DefenderFx|受击特效|
|ExplodeBuff*|(buff)引爆buff|
|ExplodeDmg*|引爆伤害|
|RGB|特效渐变|
|ExlpodeFx|引爆特效|
|EndFx|结束特效|
|AllowHitBackward*|允许击退|
|AllowHitDown*|允许击倒|
|AllowHitFly*|允许击飞|
|IntervalFx|间隔特效|
|LoopAudio|循环音效|

# 三.表格字段详细说明

- Effect
  - buff效果是指在buff影响对象属性之外,再额外给对象加flag,详见<<对象状态.md>>
  - buff效果有:
    - 普通(0)
    - 冰冻(1):控制flag
    - 灼烧(2)
    - 减速(3)
    - 禁止采集doodad(4):无用
    - 无敌(5):无敌flag
    - 隐身(6):无用
    - 潜行(7):无用
    - 反隐身(8):无用
    - 免疫DEBUFF(9)
    - 攻击反弹(10)
    - 吸收盾(11)
    - 吸血(12)
    - 长击飞(13):无用
    - 伤害转治疗(14)
    - 唤灵(15):无用
    - 霸体(16):霸体flag
    - 禁锢(17):控制flag
    - 麻痹(18):控制flag
    - 中毒(19)
    - 流血(20)
    - 虚弱(21)
    - 束缚(22):控制flag
    - 化茧(23):控制flag
- TotalTime,Interval,Overlap
  - 在buff时长(TotalTime)内,按间隔(Interval )触发buff效果(影响属性)
    - 先触发,再走间隔时间
  - Overlap为buff最大叠加层数
- StopCondition:buff终止条件
  - 移动(1)
  - 进入战斗(2)
  - 切场景(3)
  - 攻击(4)
  - 离开战斗(5)
  - 死亡(6)
- EffectID1,EffectValue1,IsPercentOnMax1
  - 触发buff效果时,会影响EffectID配置的属性,影响值为EffectValue,影响方式为IsPercentOnMax
  - IsPercentOnMax:按固定值影响or按最大值百分比影响
  - 属性id:
    - 生命值(101)
    - 物理攻击(102)
    - 魔法攻击(103)
    - 物理防御(104)
    - 魔法防御(105)
    - 生命加成(106)
    - 物攻加成(107)
    - 魔攻加成(108)
    - 物防加成(109)
    - 魔防加成(110)
    - 暴击率(201)
    - 暴击抵抗率(202)
    - 暴击伤害加成(203)
    - 暴击伤害减免(204)
    - 伤害加成(205)
    - 伤害减免(206)
    - Heal加成(207)
    - 能量max(208)
    - 霸体(209)
    - 霸体回复量(210)
    - 当前血量(2001)
    - 当前能量(2003)
    - 能量获得系数(308)
    - 破霸体系数(309)
    - Buff增益系数(310)
- ParryPara
  - 格挡减伤
  - 格式:
    - 首位
      - 1  表示减伤伤害
      - 2  表示减伤伤害百分比
    - 从第二位开始表示相应的数值
- PreBuffIDs
  - 前置buff
  - 对象身上有指定的前置buff,才可以加上buff
  - 移除前置buff
- ImmuneBuffIDs
  - 免疫buff
  - 去除已存在的,拒绝后加的
- Scale,StartScaleTime,EndScaleTime
  - Scale:模型缩放比例
  - StartScaleTime:开始模型缩放的时间,单位?
  - EndScaleTime:结束模型缩放的时间,单位?
- ExplodeBuff,ExplodeDmg
  - buff引爆buff
  - ExplodeBuff:引爆buffID
    - 只引爆对象加上的,不引爆其他人加上的
  - ExplodeDmg:按引爆buff层数,计算引爆伤害
    - 格式:层数,伤害;层数,伤害;层数,伤害...
- AllowHitBackward,AllowHitDown,AllowHitFly
  - 给对象加flag?
  - -1  不应用
  - 0   不允许
  - 1   允许