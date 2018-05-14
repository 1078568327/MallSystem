import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        for (int i = 0 ; i < n ;i++) {
            int m = in.nextInt();
            int[] a = new int[m];
            for (int j = 0; j < m; j++) {
                a[j] = in.nextInt();
            }
            System.out.println(a[0]);
        }
    }
}
