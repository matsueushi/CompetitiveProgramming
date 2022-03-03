const P = 10^9 + 7

function ksum(a, b)
    am = (a - 1) % P
    bm = b % P
    as = (am * (am + 1) ÷ 2) % P
    bs = (bm * (bm + 1) ÷ 2) % P
    (bs - as + P) % P
end

function letters(n)
    a = 0
    x = 1
    for m in 1:18
        a += m * ksum(x, min(n, 10 * x - 1))
        a %= P
        n ÷ x < 10 && break
        x *= 10
    end
    n == 10^18 && (a += 19 * ksum(n, n); a %= P)
    a
end

solve(l, r) = (letters(r) - letters(l - 1) + P) % P

function main()
    l, r = parse.(Int64, split(readline()))
    println(solve(l, r))
end

main()
