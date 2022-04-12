function atcounter(s, x)
    s, x
    nx = length(x)
    cnt = zeros(Int64, nx)
    divisor = 10^9 + 7
    for si in s
        new_cnt = copy(cnt)
        si == first(x) && (new_cnt[1] += 1)
        for i in 2:nx
            si == x[i] && (new_cnt[i] += cnt[i-1])
        end
        cnt = new_cnt .% divisor
    end
    last(cnt)
end

function main()
    n = parse(Int64, readline())
    s = readline()
    println(atcounter(s, "atcoder"))
end

main()
