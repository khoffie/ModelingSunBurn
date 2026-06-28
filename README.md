# Modeling Sunburn Damage: How Fast Will Your Skin Be Burned?
I propose a simple model to estimate the amount of burn after spending
time outside; depending on various parameters. The model estimates
three things.

1. Strength of ultraviolet (UV) radiation $U$.
2. The fraction $A$ of uv-radiation $U$ that reaches you.
3. The fraction $D$ of that radiation $A$ that reaches your skin and
   might damage it.

Let us discuss these steps in more detail:

1. The strength of UV radiation is measured as function of UV index
   $m$ and time of the day $t$. Many weather services publishe the uv
   index. The uv index measures the amount of sunburn inducing uv
   radiation. The index measures the radiation at noon, which is the
   maximum for any given day. We can then calculate the time
   difference to noon and estimate the uv index at any given time
   $u(m, t_m - t)$ where $t_m$ denotes noon, the time with the maximum
   uv intensity $m$.
2. Depending on cloud cover, shade and reflections from the ground or
   walls, a certain percentage of $U$ reaches you, if you spend time
   outdoors.
   
   $$
   A(t_1, t_2) = \int_{t_1}^{t_2} u(m, x)[c(x)s(x) + r(x)]\ dx = \int_{t_1}^{t_2} a(x) dx
   $$
   
   where $c(t)$ denotes the fraction of UV radiation that gets through
   the cloud cover at time $t$. The fraction equals one if there are
   no clouds. $s(t) \in \{0, 1\}$ denotes wheather you are in shade
   $s(t) = 1$ or not $s(t) = 0$. The amount of UV radiation that
   reaches you can be increased, if water or sand reflect sunlight.
   For example if you are at the beach, there is no shade and no
   clouds, assuming $r(x) = 1 / 4$, the fraction of $U$ reaching you
   will be $1 \times 1 + 1/4 = 5/4$. If you are in perfect shade in a
   forest, no uv radiation will reach you. If you are in perfect shade
   at the beach, uv radiation might still reach you, because it is
   reflected by sand and water.
   
3. You can take protective measures and cover your skin or use sun
   block. Wearing clothes at time $t$ means only $w(t)$ gets through
   your wear. If you do not wear clothes, then $w(t) = 1$. Sun block
   has an associated sun block factor, SBF, that determines how much
   sublight gets through. We can calculate the fraction that get's
   through the sun block as
   
   $$
       b(t) = 100 / (SPF(t) \times g(t))
   $$
   
   where $g(t)$ denotes the difference of the grease you should have
   to get the desired $SPF$ and the amount you actually have. For
   example if you sweat or bath extensively, or if you simply used too
   little, the protective factor is reduced.
   
Then, we can write the amount of UV radiation reaching your skin as

$$
D(t_1, t_2) = \int_{t_1}^{t_2} a(x)w(x)b(x)\ dx
$$

Your skin has some natural resistance $N$ to UV radiation, which is
determined by your skin type. Setting some skin type to one, the
skintype then gives a factor, multiplying the amount of UV radiation
that might damage you. If the amount $D$ reaching your skin is larger
than your resistance, you get burned proportional to the total amount
reaching you.
   
Something like $Burn(t_1, t_2) = D(t_1, t_2) - N$
