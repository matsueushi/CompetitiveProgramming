const B = 100000007
const P = 1000000007

struct RollingHash
    n::Int64
    x::Vector{Int64}
    hs::Vector{Int64}
    pws::Vector{Int64}
    function RollingHash(x)
        n = length(x)
        hs = zeros(Int64, n + 1)
        pws = ones(Int64, n + 1)
        for i in 1:n
            hs[i+1] = (B * hs[i] + x[i]) % P
            pws[i+1] = pws[i] * B % P
        end
        new(n, x, hs, pws)
    end
end

hash(rh::RollingHash, i, j) = mod(rh.hs[j+1] - rh.hs[i] * rh.pws[j-i+1+1], P)


function rolling_match(rh1::RollingHash, rh2::RollingHash)
    res = 0
    n = rh1.n
    for i in -(n - 1):-1
        h1 = hash(rh1, -i + 1, n)
        h2 = hash(rh2, 1, n + i)
        h1 == h2 && (res += 1)
    end
    for i in 0:n-1
        h1 = hash(rh1, 1, n - i)
        h2 = hash(rh2, i + 1, n)
        h1 == h2 && (res += 1)
    end
    res
end

function solve(n, s, t)
    map_s = Dict('R' => 0, 'G' => 1, 'B' => 2)
    rh_s = RollingHash([map_s[x] for x in s])
    map_t_r = Dict('R' => 0, 'G' => 2, 'B' => 1)
    rh_t_r = RollingHash([map_t_r[x] for x in t])
    map_t_g = Dict('R' => 2, 'G' => 1, 'B' => 0)
    rh_t_g = RollingHash([map_t_g[x] for x in t])
    map_t_b = Dict('R' => 1, 'G' => 0, 'B' => 2)
    rh_t_b = RollingHash([map_t_b[x] for x in t])
    rolling_match(rh_s, rh_t_r) + rolling_match(rh_s, rh_t_g) + rolling_match(rh_s, rh_t_b)
end

function main()
    n = parse.(Int64, readline())
    s = readline()
    t = readline()
    println(solve(n, s, t))
end

main()
