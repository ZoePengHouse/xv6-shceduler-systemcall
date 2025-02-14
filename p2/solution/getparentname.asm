
_getparentname:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
// getparentname.c
#include "types.h"
#include "stat.h"
#include "user.h"
int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
	char parentbuf[256];
	char childbuf[256];

	if(getparentname(parentbuf,childbuf, 5, 5) == 0)
   f:	8d b5 e8 fe ff ff    	lea    -0x118(%ebp),%esi
  15:	8d 9d e8 fd ff ff    	lea    -0x218(%ebp),%ebx
{
  1b:	51                   	push   %ecx
  1c:	81 ec 0c 02 00 00    	sub    $0x20c,%esp
	if(getparentname(parentbuf,childbuf, 5, 5) == 0)
  22:	6a 05                	push   $0x5
  24:	6a 05                	push   $0x5
  26:	56                   	push   %esi
  27:	53                   	push   %ebx
  28:	e8 16 03 00 00       	call   343 <getparentname>
  2d:	83 c4 10             	add    $0x10,%esp
  30:	85 c0                	test   %eax,%eax
  32:	74 05                	je     39 <main+0x39>
	{
		printf(1, "XV6_TEST_OUTPUT Parent name: %s Child name: %s\n", parentbuf, childbuf);
	}
	exit();
  34:	e8 6a 02 00 00       	call   2a3 <exit>
		printf(1, "XV6_TEST_OUTPUT Parent name: %s Child name: %s\n", parentbuf, childbuf);
  39:	56                   	push   %esi
  3a:	53                   	push   %ebx
  3b:	68 28 07 00 00       	push   $0x728
  40:	6a 01                	push   $0x1
  42:	e8 b9 03 00 00       	call   400 <printf>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	eb e8                	jmp    34 <main+0x34>
  4c:	66 90                	xchg   %ax,%ax
  4e:	66 90                	xchg   %ax,%ax

00000050 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  50:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  51:	31 c0                	xor    %eax,%eax
{
  53:	89 e5                	mov    %esp,%ebp
  55:	53                   	push   %ebx
  56:	8b 4d 08             	mov    0x8(%ebp),%ecx
  59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  60:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  64:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  67:	83 c0 01             	add    $0x1,%eax
  6a:	84 d2                	test   %dl,%dl
  6c:	75 f2                	jne    60 <strcpy+0x10>
    ;
  return os;
}
  6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  71:	89 c8                	mov    %ecx,%eax
  73:	c9                   	leave  
  74:	c3                   	ret    
  75:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 55 08             	mov    0x8(%ebp),%edx
  87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  8a:	0f b6 02             	movzbl (%edx),%eax
  8d:	84 c0                	test   %al,%al
  8f:	75 17                	jne    a8 <strcmp+0x28>
  91:	eb 3a                	jmp    cd <strcmp+0x4d>
  93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  97:	90                   	nop
  98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  9c:	83 c2 01             	add    $0x1,%edx
  9f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  a2:	84 c0                	test   %al,%al
  a4:	74 1a                	je     c0 <strcmp+0x40>
    p++, q++;
  a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  a8:	0f b6 19             	movzbl (%ecx),%ebx
  ab:	38 c3                	cmp    %al,%bl
  ad:	74 e9                	je     98 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  af:	29 d8                	sub    %ebx,%eax
}
  b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b4:	c9                   	leave  
  b5:	c3                   	ret    
  b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  c4:	31 c0                	xor    %eax,%eax
  c6:	29 d8                	sub    %ebx,%eax
}
  c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cb:	c9                   	leave  
  cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  cd:	0f b6 19             	movzbl (%ecx),%ebx
  d0:	31 c0                	xor    %eax,%eax
  d2:	eb db                	jmp    af <strcmp+0x2f>
  d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 3a 00             	cmpb   $0x0,(%edx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 c0                	xor    %eax,%eax
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c0 01             	add    $0x1,%eax
  f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  f7:	89 c1                	mov    %eax,%ecx
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	89 c8                	mov    %ecx,%eax
  fd:	5d                   	pop    %ebp
  fe:	c3                   	ret    
  ff:	90                   	nop
  for(n = 0; s[n]; n++)
 100:	31 c9                	xor    %ecx,%ecx
}
 102:	5d                   	pop    %ebp
 103:	89 c8                	mov    %ecx,%eax
 105:	c3                   	ret    
 106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	8b 7d fc             	mov    -0x4(%ebp),%edi
 125:	89 d0                	mov    %edx,%eax
 127:	c9                   	leave  
 128:	c3                   	ret    
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	75 12                	jne    153 <strchr+0x23>
 141:	eb 1d                	jmp    160 <strchr+0x30>
 143:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 147:	90                   	nop
 148:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 14c:	83 c0 01             	add    $0x1,%eax
 14f:	84 d2                	test   %dl,%dl
 151:	74 0d                	je     160 <strchr+0x30>
    if(*s == c)
 153:	38 d1                	cmp    %dl,%cl
 155:	75 f1                	jne    148 <strchr+0x18>
      return (char*)s;
  return 0;
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 160:	31 c0                	xor    %eax,%eax
}
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 175:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 178:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 179:	31 db                	xor    %ebx,%ebx
{
 17b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 17e:	eb 27                	jmp    1a7 <gets+0x37>
    cc = read(0, &c, 1);
 180:	83 ec 04             	sub    $0x4,%esp
 183:	6a 01                	push   $0x1
 185:	57                   	push   %edi
 186:	6a 00                	push   $0x0
 188:	e8 2e 01 00 00       	call   2bb <read>
    if(cc < 1)
 18d:	83 c4 10             	add    $0x10,%esp
 190:	85 c0                	test   %eax,%eax
 192:	7e 1d                	jle    1b1 <gets+0x41>
      break;
    buf[i++] = c;
 194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 198:	8b 55 08             	mov    0x8(%ebp),%edx
 19b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 19f:	3c 0a                	cmp    $0xa,%al
 1a1:	74 1d                	je     1c0 <gets+0x50>
 1a3:	3c 0d                	cmp    $0xd,%al
 1a5:	74 19                	je     1c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1a7:	89 de                	mov    %ebx,%esi
 1a9:	83 c3 01             	add    $0x1,%ebx
 1ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1af:	7c cf                	jl     180 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1bb:	5b                   	pop    %ebx
 1bc:	5e                   	pop    %esi
 1bd:	5f                   	pop    %edi
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    
  buf[i] = '\0';
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	89 de                	mov    %ebx,%esi
 1c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cc:	5b                   	pop    %ebx
 1cd:	5e                   	pop    %esi
 1ce:	5f                   	pop    %edi
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 f1 00 00 00       	call   2e3 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 f4 00 00 00       	call   2fb <fstat>
  close(fd);
 207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 20a:	89 c6                	mov    %eax,%esi
  close(fd);
 20c:	e8 ba 00 00 00       	call   2cb <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	89 f0                	mov    %esi,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 220:	be ff ff ff ff       	mov    $0xffffffff,%esi
 225:	eb ed                	jmp    214 <stat+0x34>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 02             	movsbl (%edx),%eax
 23a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 240:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 245:	77 1e                	ja     265 <atoi+0x35>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 250:	83 c2 01             	add    $0x1,%edx
 253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 25a:	0f be 02             	movsbl (%edx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
  return n;
}
 265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 268:	89 c8                	mov    %ecx,%eax
 26a:	c9                   	leave  
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	8b 55 08             	mov    0x8(%ebp),%edx
 27a:	56                   	push   %esi
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 c0                	test   %eax,%eax
 280:	7e 13                	jle    295 <memmove+0x25>
 282:	01 d0                	add    %edx,%eax
  dst = vdst;
 284:	89 d7                	mov    %edx,%edi
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 291:	39 f8                	cmp    %edi,%eax
 293:	75 fb                	jne    290 <memmove+0x20>
  return vdst;
}
 295:	5e                   	pop    %esi
 296:	89 d0                	mov    %edx,%eax
 298:	5f                   	pop    %edi
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret    

0000029b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29b:	b8 01 00 00 00       	mov    $0x1,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <exit>:
SYSCALL(exit)
 2a3:	b8 02 00 00 00       	mov    $0x2,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <wait>:
SYSCALL(wait)
 2ab:	b8 03 00 00 00       	mov    $0x3,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <pipe>:
SYSCALL(pipe)
 2b3:	b8 04 00 00 00       	mov    $0x4,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <read>:
SYSCALL(read)
 2bb:	b8 05 00 00 00       	mov    $0x5,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <write>:
SYSCALL(write)
 2c3:	b8 10 00 00 00       	mov    $0x10,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <close>:
SYSCALL(close)
 2cb:	b8 15 00 00 00       	mov    $0x15,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <kill>:
SYSCALL(kill)
 2d3:	b8 06 00 00 00       	mov    $0x6,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <exec>:
SYSCALL(exec)
 2db:	b8 07 00 00 00       	mov    $0x7,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <open>:
SYSCALL(open)
 2e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mknod>:
SYSCALL(mknod)
 2eb:	b8 11 00 00 00       	mov    $0x11,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <unlink>:
SYSCALL(unlink)
 2f3:	b8 12 00 00 00       	mov    $0x12,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <fstat>:
SYSCALL(fstat)
 2fb:	b8 08 00 00 00       	mov    $0x8,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <link>:
SYSCALL(link)
 303:	b8 13 00 00 00       	mov    $0x13,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <mkdir>:
SYSCALL(mkdir)
 30b:	b8 14 00 00 00       	mov    $0x14,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <chdir>:
SYSCALL(chdir)
 313:	b8 09 00 00 00       	mov    $0x9,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <dup>:
SYSCALL(dup)
 31b:	b8 0a 00 00 00       	mov    $0xa,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <getpid>:
SYSCALL(getpid)
 323:	b8 0b 00 00 00       	mov    $0xb,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <sbrk>:
SYSCALL(sbrk)
 32b:	b8 0c 00 00 00       	mov    $0xc,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <sleep>:
SYSCALL(sleep)
 333:	b8 0d 00 00 00       	mov    $0xd,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <uptime>:
SYSCALL(uptime)
 33b:	b8 0e 00 00 00       	mov    $0xe,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <getparentname>:
SYSCALL(getparentname)
 343:	b8 16 00 00 00       	mov    $0x16,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    
 34b:	66 90                	xchg   %ax,%ax
 34d:	66 90                	xchg   %ax,%ax
 34f:	90                   	nop

00000350 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 3c             	sub    $0x3c,%esp
 359:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 35c:	89 d1                	mov    %edx,%ecx
{
 35e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 361:	85 d2                	test   %edx,%edx
 363:	0f 89 7f 00 00 00    	jns    3e8 <printint+0x98>
 369:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 36d:	74 79                	je     3e8 <printint+0x98>
    neg = 1;
 36f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 376:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 378:	31 db                	xor    %ebx,%ebx
 37a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 380:	89 c8                	mov    %ecx,%eax
 382:	31 d2                	xor    %edx,%edx
 384:	89 cf                	mov    %ecx,%edi
 386:	f7 75 c4             	divl   -0x3c(%ebp)
 389:	0f b6 92 b8 07 00 00 	movzbl 0x7b8(%edx),%edx
 390:	89 45 c0             	mov    %eax,-0x40(%ebp)
 393:	89 d8                	mov    %ebx,%eax
 395:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 398:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 39b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 39e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3a1:	76 dd                	jbe    380 <printint+0x30>
  if(neg)
 3a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3a6:	85 c9                	test   %ecx,%ecx
 3a8:	74 0c                	je     3b6 <printint+0x66>
    buf[i++] = '-';
 3aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3bd:	eb 07                	jmp    3c6 <printint+0x76>
 3bf:	90                   	nop
    putc(fd, buf[i]);
 3c0:	0f b6 13             	movzbl (%ebx),%edx
 3c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3c6:	83 ec 04             	sub    $0x4,%esp
 3c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3cc:	6a 01                	push   $0x1
 3ce:	56                   	push   %esi
 3cf:	57                   	push   %edi
 3d0:	e8 ee fe ff ff       	call   2c3 <write>
  while(--i >= 0)
 3d5:	83 c4 10             	add    $0x10,%esp
 3d8:	39 de                	cmp    %ebx,%esi
 3da:	75 e4                	jne    3c0 <printint+0x70>
}
 3dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3df:	5b                   	pop    %ebx
 3e0:	5e                   	pop    %esi
 3e1:	5f                   	pop    %edi
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3ef:	eb 87                	jmp    378 <printint+0x28>
 3f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop

00000400 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 409:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 40c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 40f:	0f b6 13             	movzbl (%ebx),%edx
 412:	84 d2                	test   %dl,%dl
 414:	74 6a                	je     480 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 416:	8d 45 10             	lea    0x10(%ebp),%eax
 419:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 41c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 41f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 421:	89 45 d0             	mov    %eax,-0x30(%ebp)
 424:	eb 36                	jmp    45c <printf+0x5c>
 426:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi
 430:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 433:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 438:	83 f8 25             	cmp    $0x25,%eax
 43b:	74 15                	je     452 <printf+0x52>
  write(fd, &c, 1);
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	88 55 e7             	mov    %dl,-0x19(%ebp)
 443:	6a 01                	push   $0x1
 445:	57                   	push   %edi
 446:	56                   	push   %esi
 447:	e8 77 fe ff ff       	call   2c3 <write>
 44c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 44f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 452:	0f b6 13             	movzbl (%ebx),%edx
 455:	83 c3 01             	add    $0x1,%ebx
 458:	84 d2                	test   %dl,%dl
 45a:	74 24                	je     480 <printf+0x80>
    c = fmt[i] & 0xff;
 45c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 45f:	85 c9                	test   %ecx,%ecx
 461:	74 cd                	je     430 <printf+0x30>
      }
    } else if(state == '%'){
 463:	83 f9 25             	cmp    $0x25,%ecx
 466:	75 ea                	jne    452 <printf+0x52>
      if(c == 'd'){
 468:	83 f8 25             	cmp    $0x25,%eax
 46b:	0f 84 07 01 00 00    	je     578 <printf+0x178>
 471:	83 e8 63             	sub    $0x63,%eax
 474:	83 f8 15             	cmp    $0x15,%eax
 477:	77 17                	ja     490 <printf+0x90>
 479:	ff 24 85 60 07 00 00 	jmp    *0x760(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 480:	8d 65 f4             	lea    -0xc(%ebp),%esp
 483:	5b                   	pop    %ebx
 484:	5e                   	pop    %esi
 485:	5f                   	pop    %edi
 486:	5d                   	pop    %ebp
 487:	c3                   	ret    
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop
  write(fd, &c, 1);
 490:	83 ec 04             	sub    $0x4,%esp
 493:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 496:	6a 01                	push   $0x1
 498:	57                   	push   %edi
 499:	56                   	push   %esi
 49a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 49e:	e8 20 fe ff ff       	call   2c3 <write>
        putc(fd, c);
 4a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4a7:	83 c4 0c             	add    $0xc,%esp
 4aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4ad:	6a 01                	push   $0x1
 4af:	57                   	push   %edi
 4b0:	56                   	push   %esi
 4b1:	e8 0d fe ff ff       	call   2c3 <write>
        putc(fd, c);
 4b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4b9:	31 c9                	xor    %ecx,%ecx
 4bb:	eb 95                	jmp    452 <printf+0x52>
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4c0:	83 ec 0c             	sub    $0xc,%esp
 4c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4c8:	6a 00                	push   $0x0
 4ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4cd:	8b 10                	mov    (%eax),%edx
 4cf:	89 f0                	mov    %esi,%eax
 4d1:	e8 7a fe ff ff       	call   350 <printint>
        ap++;
 4d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4dd:	31 c9                	xor    %ecx,%ecx
 4df:	e9 6e ff ff ff       	jmp    452 <printf+0x52>
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4eb:	8b 10                	mov    (%eax),%edx
        ap++;
 4ed:	83 c0 04             	add    $0x4,%eax
 4f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4f3:	85 d2                	test   %edx,%edx
 4f5:	0f 84 8d 00 00 00    	je     588 <printf+0x188>
        while(*s != 0){
 4fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 4fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 500:	84 c0                	test   %al,%al
 502:	0f 84 4a ff ff ff    	je     452 <printf+0x52>
 508:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 50b:	89 d3                	mov    %edx,%ebx
 50d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 510:	83 ec 04             	sub    $0x4,%esp
          s++;
 513:	83 c3 01             	add    $0x1,%ebx
 516:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 519:	6a 01                	push   $0x1
 51b:	57                   	push   %edi
 51c:	56                   	push   %esi
 51d:	e8 a1 fd ff ff       	call   2c3 <write>
        while(*s != 0){
 522:	0f b6 03             	movzbl (%ebx),%eax
 525:	83 c4 10             	add    $0x10,%esp
 528:	84 c0                	test   %al,%al
 52a:	75 e4                	jne    510 <printf+0x110>
      state = 0;
 52c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 52f:	31 c9                	xor    %ecx,%ecx
 531:	e9 1c ff ff ff       	jmp    452 <printf+0x52>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 540:	83 ec 0c             	sub    $0xc,%esp
 543:	b9 0a 00 00 00       	mov    $0xa,%ecx
 548:	6a 01                	push   $0x1
 54a:	e9 7b ff ff ff       	jmp    4ca <printf+0xca>
 54f:	90                   	nop
        putc(fd, *ap);
 550:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 553:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 556:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 558:	6a 01                	push   $0x1
 55a:	57                   	push   %edi
 55b:	56                   	push   %esi
        putc(fd, *ap);
 55c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 55f:	e8 5f fd ff ff       	call   2c3 <write>
        ap++;
 564:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 568:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56b:	31 c9                	xor    %ecx,%ecx
 56d:	e9 e0 fe ff ff       	jmp    452 <printf+0x52>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 578:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 57b:	83 ec 04             	sub    $0x4,%esp
 57e:	e9 2a ff ff ff       	jmp    4ad <printf+0xad>
 583:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 587:	90                   	nop
          s = "(null)";
 588:	ba 58 07 00 00       	mov    $0x758,%edx
        while(*s != 0){
 58d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 590:	b8 28 00 00 00       	mov    $0x28,%eax
 595:	89 d3                	mov    %edx,%ebx
 597:	e9 74 ff ff ff       	jmp    510 <printf+0x110>
 59c:	66 90                	xchg   %ax,%ax
 59e:	66 90                	xchg   %ax,%ax

000005a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a1:	a1 68 0a 00 00       	mov    0xa68,%eax
{
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	53                   	push   %ebx
 5ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	89 c2                	mov    %eax,%edx
 5ba:	8b 00                	mov    (%eax),%eax
 5bc:	39 ca                	cmp    %ecx,%edx
 5be:	73 30                	jae    5f0 <free+0x50>
 5c0:	39 c1                	cmp    %eax,%ecx
 5c2:	72 04                	jb     5c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c4:	39 c2                	cmp    %eax,%edx
 5c6:	72 f0                	jb     5b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ce:	39 f8                	cmp    %edi,%eax
 5d0:	74 30                	je     602 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5d5:	8b 42 04             	mov    0x4(%edx),%eax
 5d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5db:	39 f1                	cmp    %esi,%ecx
 5dd:	74 3a                	je     619 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5e1:	5b                   	pop    %ebx
  freep = p;
 5e2:	89 15 68 0a 00 00    	mov    %edx,0xa68
}
 5e8:	5e                   	pop    %esi
 5e9:	5f                   	pop    %edi
 5ea:	5d                   	pop    %ebp
 5eb:	c3                   	ret    
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f0:	39 c2                	cmp    %eax,%edx
 5f2:	72 c4                	jb     5b8 <free+0x18>
 5f4:	39 c1                	cmp    %eax,%ecx
 5f6:	73 c0                	jae    5b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 5f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	39 f8                	cmp    %edi,%eax
 600:	75 d0                	jne    5d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 602:	03 70 04             	add    0x4(%eax),%esi
 605:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 608:	8b 02                	mov    (%edx),%eax
 60a:	8b 00                	mov    (%eax),%eax
 60c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 60f:	8b 42 04             	mov    0x4(%edx),%eax
 612:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 615:	39 f1                	cmp    %esi,%ecx
 617:	75 c6                	jne    5df <free+0x3f>
    p->s.size += bp->s.size;
 619:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 61c:	89 15 68 0a 00 00    	mov    %edx,0xa68
    p->s.size += bp->s.size;
 622:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 625:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 628:	89 0a                	mov    %ecx,(%edx)
}
 62a:	5b                   	pop    %ebx
 62b:	5e                   	pop    %esi
 62c:	5f                   	pop    %edi
 62d:	5d                   	pop    %ebp
 62e:	c3                   	ret    
 62f:	90                   	nop

00000630 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 639:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 63c:	8b 3d 68 0a 00 00    	mov    0xa68,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 642:	8d 70 07             	lea    0x7(%eax),%esi
 645:	c1 ee 03             	shr    $0x3,%esi
 648:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 64b:	85 ff                	test   %edi,%edi
 64d:	0f 84 9d 00 00 00    	je     6f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 653:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 655:	8b 4a 04             	mov    0x4(%edx),%ecx
 658:	39 f1                	cmp    %esi,%ecx
 65a:	73 6a                	jae    6c6 <malloc+0x96>
 65c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 661:	39 de                	cmp    %ebx,%esi
 663:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 666:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 66d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 670:	eb 17                	jmp    689 <malloc+0x59>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 678:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 67a:	8b 48 04             	mov    0x4(%eax),%ecx
 67d:	39 f1                	cmp    %esi,%ecx
 67f:	73 4f                	jae    6d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 681:	8b 3d 68 0a 00 00    	mov    0xa68,%edi
 687:	89 c2                	mov    %eax,%edx
 689:	39 d7                	cmp    %edx,%edi
 68b:	75 eb                	jne    678 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 68d:	83 ec 0c             	sub    $0xc,%esp
 690:	ff 75 e4             	push   -0x1c(%ebp)
 693:	e8 93 fc ff ff       	call   32b <sbrk>
  if(p == (char*)-1)
 698:	83 c4 10             	add    $0x10,%esp
 69b:	83 f8 ff             	cmp    $0xffffffff,%eax
 69e:	74 1c                	je     6bc <malloc+0x8c>
  hp->s.size = nu;
 6a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6a3:	83 ec 0c             	sub    $0xc,%esp
 6a6:	83 c0 08             	add    $0x8,%eax
 6a9:	50                   	push   %eax
 6aa:	e8 f1 fe ff ff       	call   5a0 <free>
  return freep;
 6af:	8b 15 68 0a 00 00    	mov    0xa68,%edx
      if((p = morecore(nunits)) == 0)
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	85 d2                	test   %edx,%edx
 6ba:	75 bc                	jne    678 <malloc+0x48>
        return 0;
  }
}
 6bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6bf:	31 c0                	xor    %eax,%eax
}
 6c1:	5b                   	pop    %ebx
 6c2:	5e                   	pop    %esi
 6c3:	5f                   	pop    %edi
 6c4:	5d                   	pop    %ebp
 6c5:	c3                   	ret    
    if(p->s.size >= nunits){
 6c6:	89 d0                	mov    %edx,%eax
 6c8:	89 fa                	mov    %edi,%edx
 6ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6d0:	39 ce                	cmp    %ecx,%esi
 6d2:	74 4c                	je     720 <malloc+0xf0>
        p->s.size -= nunits;
 6d4:	29 f1                	sub    %esi,%ecx
 6d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6df:	89 15 68 0a 00 00    	mov    %edx,0xa68
}
 6e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6e8:	83 c0 08             	add    $0x8,%eax
}
 6eb:	5b                   	pop    %ebx
 6ec:	5e                   	pop    %esi
 6ed:	5f                   	pop    %edi
 6ee:	5d                   	pop    %ebp
 6ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 6f0:	c7 05 68 0a 00 00 6c 	movl   $0xa6c,0xa68
 6f7:	0a 00 00 
    base.s.size = 0;
 6fa:	bf 6c 0a 00 00       	mov    $0xa6c,%edi
    base.s.ptr = freep = prevp = &base;
 6ff:	c7 05 6c 0a 00 00 6c 	movl   $0xa6c,0xa6c
 706:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 709:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 70b:	c7 05 70 0a 00 00 00 	movl   $0x0,0xa70
 712:	00 00 00 
    if(p->s.size >= nunits){
 715:	e9 42 ff ff ff       	jmp    65c <malloc+0x2c>
 71a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 720:	8b 08                	mov    (%eax),%ecx
 722:	89 0a                	mov    %ecx,(%edx)
 724:	eb b9                	jmp    6df <malloc+0xaf>
