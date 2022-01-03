const Footer = () => {
  return (
    <div className="border-t bg-gray-200 border-gray-300">
      <footer className="flex justify-center text-center p-2 text-sm max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          주식회사 배움과 채움  대표 이착공 - 오늘도 착공하세요!<br/>
          서울특별시 성북구 보국문로 87-24 (정릉동 310-5) 배움과 채움 <br/>
          &copy; {new Date().getFullYear()} (주)배움과 채움 - All rights reserved
      </footer>
    </div>
  );
};

export default Footer;
